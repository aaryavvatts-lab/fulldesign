#!/usr/bin/env bash
# Installs /fulldesign and every design skill it can use, from their original authors' repos.
# Usage: ./scripts/install.sh [--dry-run] [--fulldesign-only]
set -uo pipefail

REPO_URL="https://github.com/aaryavvatts-lab/fulldesign.git"
SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
REFS_DIR="${FULLDESIGN_REFS_DIR:-$HOME/.claude/fulldesign-refs}"
DRY=0; ONLY=0
for a in "$@"; do case "$a" in --dry-run) DRY=1;; --fulldesign-only) ONLY=1;; -h|--help) sed -n 2,3p "$0"; exit 0;; esac; done

exec 3>&1
run() { if [ "$DRY" = 1 ]; then echo "  [dry-run] $*" >&3; else "$@"; fi; }
say() { printf '\n==> %s\n' "$*"; }
FAILED=()

for bin in git node npm npx python3; do
  command -v "$bin" >/dev/null 2>&1 || { echo "Missing required tool: $bin"; exit 1; }
done

# Locate the repo (works from a clone, or via curl | bash).
HERE="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || true)"
if [ -n "$HERE" ] && [ -f "$HERE/../skills.json" ]; then
  ROOT="$(cd "$HERE/.." && pwd)"
else
  ROOT="$(mktemp -d)"; say "Cloning $REPO_URL"; git clone -q --depth 1 "$REPO_URL" "$ROOT" || { echo "clone failed"; exit 1; }
fi

say "Installing the /fulldesign skill into $SKILLS_DIR"
run mkdir -p "$SKILLS_DIR/fulldesign"
run cp "$ROOT/skills/fulldesign/SKILL.md" "$ROOT/skills/fulldesign/catalog.md" "$SKILLS_DIR/fulldesign/"
[ "$ONLY" = 1 ] && { echo "Done (fulldesign only)."; exit 0; }

# Group the 'skills'-type entries by source repo and install each repo once.
say "Installing design skills from their original repos"
PLAN="$(python3 -I - "$ROOT/skills.json" <<'PY'
import json, sys, collections
d = json.load(open(sys.argv[1]))["skills"]
by = collections.OrderedDict()
for s in d:
    if s["install"] == "skills":
        by.setdefault(s["repo"], []).append(s["name"])
for repo, names in by.items():
    print(repo + "\t" + " ".join(names))
PY
)"
while IFS=$'\t' read -r repo names; do
  [ -z "$repo" ] && continue
  echo "  $repo: $names"
  # shellcheck disable=SC2086
  (cd "$HOME" && run npx -y skills add "$repo" -g -y -a claude-code --skill $names </dev/null >/dev/null 2>&1) || FAILED+=("$repo")
done <<< "$PLAN"

say "21st CLI and skills (needs a free 21st.dev account: run '21st login' afterwards)"
run npm install -g @21st-dev/cli >/dev/null 2>&1 || FAILED+=("21st-cli")
(cd "$HOME" && run npx -y @21st-dev/cli install-skill </dev/null >/dev/null 2>&1) || FAILED+=("21st-skills")

say "Playwright CLI and its skill"
run npm install -g @playwright/cli@latest >/dev/null 2>&1 || FAILED+=("playwright-cli")
(cd "$HOME" && run playwright-cli install --skills </dev/null >/dev/null 2>&1) || FAILED+=("playwright-skill")

say "Awesome DESIGN.md library (84 brand design systems) into $REFS_DIR"
run mkdir -p "$REFS_DIR"
if [ -d "$REFS_DIR/awesome-design-md/.git" ]; then
  run git -C "$REFS_DIR/awesome-design-md" pull -q --ff-only || FAILED+=("awesome-design-md")
else
  run git clone -q --depth 1 https://github.com/VoltAgent/awesome-design-md.git "$REFS_DIR/awesome-design-md" || FAILED+=("awesome-design-md")
fi

if [ "$DRY" = 0 ]; then
  say "Verifying"
  MISSING="$(python3 -I - "$ROOT/skills.json" "$SKILLS_DIR" <<'PY'
import json, sys, os
d = json.load(open(sys.argv[1]))["skills"]
for s in d:
    if s["install"] in ("skills", "21st", "playwright") and not os.path.isfile(os.path.join(sys.argv[2], s["name"], "SKILL.md")):
        print(s["name"])
PY
)"
  TOTAL="$(python3 -I -c "import json,sys;print(sum(1 for s in json.load(open(sys.argv[1]))['skills'] if s['install']!='clone'))" "$ROOT/skills.json")"
  if [ -z "$MISSING" ]; then echo "  All $TOTAL skills present."; else echo "  Missing skills:"; echo "$MISSING" | sed 's/^/    - /'; fi
  [ "${#FAILED[@]}" -gt 0 ] && echo "  Steps that reported errors: ${FAILED[*]}"
fi

cat <<'MSG'

Done. Next steps:
  1. Restart Claude Code so it loads the new skills.
  2. Run `21st login` once (opens your browser) to enable the 21st skills.
  3. In any project, type /fulldesign and describe what you want.
MSG
