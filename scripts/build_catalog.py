#!/usr/bin/env python3
"""Generate skills/fulldesign/catalog.md and the README skill table from skills.json."""
import json, pathlib, re, collections

root = pathlib.Path(__file__).resolve().parent.parent
skills = json.loads((root / "skills.json").read_text())["skills"]

def link(s):
    if not s["repo"]:
        return None
    base = f"https://github.com/{s['repo']}"
    return f"{base}/tree/HEAD/{s['path']}" if s["path"] else base

groups = collections.OrderedDict()
for s in skills:
    groups.setdefault(s["group"], []).append(s)

lines = [
    "# fulldesign catalog",
    "",
    f"{len(skills)} entries `/fulldesign` can choose from. Each row: skill (linked to its source), what it does, and when to use it.",
    "Skills marked (21st) install through the 21st CLI; the reference library is a folder of files, not a skill.",
    "",
]
table = []
for g, items in groups.items():
    lines += [f"## {g}", "", "| Skill | What it does | Use it when |", "|---|---|---|"]
    table += [f"### {g}", "", "| Skill | What it does | Use it when |", "|---|---|---|"]
    for s in items:
        l = link(s)
        name = f"[`{s['name']}`]({l})" if l else f"`{s['name']}` (manual)"
        row = f"| {name} | {s['desc']} | {s['use']} |"
        lines.append(row)
        table.append(row)
    lines.append("")
    table.append("")

(root / "skills/fulldesign/catalog.md").write_text("\n".join(lines))

readme = root / "README.md"
if readme.exists():
    txt = readme.read_text()
    new = f"<!-- CATALOG:START -->\n{chr(10).join(table)}\n<!-- CATALOG:END -->"
    txt = re.sub(r"<!-- CATALOG:START -->.*<!-- CATALOG:END -->", lambda m: new, txt, flags=re.S)
    readme.write_text(txt)
print(f"catalog.md written with {len(skills)} skills in {len(groups)} groups")
