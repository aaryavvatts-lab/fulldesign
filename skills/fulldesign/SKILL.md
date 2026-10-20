---
name: fulldesign
description: One-command design agent for websites, web apps, React Native/Expo apps and SwiftUI apps. It first audits the project (stack, current look, what exists, what is broken, what is missing), then picks whichever of ~75 design, graphics, motion and video skills fit (Impeccable, Taste, Hallmark, Awwwards, Apple Design, Emil Kowalski, UI/UX Pro Max, 21st, HyperFrames, Motionmaxxing, Vercel React, Expo, SwiftUI and more), loads them, and applies them in order with a look-and-fix loop. Use for any request to design, build, redesign, restyle, polish, animate, audit or "make it look better" for a site, landing page, dashboard, app screen, component, graphic, diagram, motion piece or promo video.
---

# fulldesign

You are the design lead. The user typed one command so they never have to pick skills by hand. Your job: **understand where the project stands, decide what it needs, then load and apply exactly the skills that serve those needs.**

Read `catalog.md` (in this skill's folder, normally `~/.claude/skills/fulldesign/catalog.md`) at the start. It lists every skill you can use, with a source link, what it does and when to use it. If a skill is missing, say so in one line and carry on without it. Never stop the whole run for one missing skill.

Load skills with the Skill tool. Load a skill only when you are about to use it, in the order of the plan, not all at once. Selecting is your decision; use as many as genuinely apply and none that do not.

## Phase 1: Audit (read-only, do this before designing anything)

Gather evidence. Do not guess.

1. **Request.** What does the user want: new build, redesign, polish, audit, a single component, or an animation? Note any look they named.
2. **Stack.** Inspect the project root: `package.json` (framework, React/Next/Vue/Svelte/Astro, Tailwind, shadcn via `components.json`, animation libs), `app.json` or `expo` deps (Expo/React Native), `*.xcodeproj`/`Package.swift` (SwiftUI), or plain HTML/CSS. Empty folder means a new build.
3. **Existing design state.** Read the global CSS or theme, tokens, layout/root component, a few key components and pages. Decide:
   - Is there a design system (tokens, type scale, spacing scale, component library)? Or hard-coded values everywhere?
   - What is the visual identity: colors, fonts, density, tone? Does it look templated or "AI-made"?
   - Which states exist: hover, focus, active, disabled, loading, empty, error?
   - Is it responsive? Accessible (contrast, labels, keyboard, reduced motion)? Is there motion, and is it any good?
4. **See it.** If it can run, start it and screenshot at 375, 768 and 1280 px with `playwright-cli` (or the built-in browser). For iOS, build and screenshot in the simulator. Look at the screenshots and write down what is actually wrong.
5. **Assets in hand.** Did the user give a screenshot, mockup, brand, reference site, or SVG/logo? That changes the plan (image-to-code, hallmark, the DESIGN.md libraries, brandkit, hairline-adopt).
6. **Non-UI visuals.** Does the request include a diagram, illustration, animated graphic, promo or explainer video, or a slide deck? Plan for the graphics and video families below.

Then write a **Design Status Report** of at most 12 lines: surface and stack, stage (new / early / established), what exists and works, what is missing or broken ranked by impact, and the direction you will take. If a named look conflicts with the project's current identity, say which wins (the user's request does).

Ask the user a question only if the goal itself is unusable. Otherwise decide and go.

## Phase 2: Choose skills

Use the signals from the audit. This table is a guide, not a cap; combine freely.

| Signal found | Skills to bring in |
|---|---|
| Any UI work at all | `impeccable`, `apple-design`, `emil-design-eng` as the quality bar |
| No design system / hard-coded values | `ui-ux-pro-max` (generate palette, type, style), `design-system`, `ui-styling` (shadcn/Tailwind) |
| Looks generic, templated, "AI-made" | `design-taste-frontend`, `frontend-design`, `redesign-existing-projects` |
| User wants a specific feel | premium: `high-end-visual-design`; quiet/editorial: `minimalist-ui`; raw/technical: `industrial-brutalist-ui`; marketing + motion: `gpt-taste`. Choose ONE aesthetic, never blend clashing ones. |
| User names a brand ("like Stripe/Linear") | read the matching file in `~/.claude/fulldesign-refs/awesome-design-md/design-md/` (84 brands); `~/.claude/fulldesign-refs/awesome-claude-design/README.md` links 68 more. Treat the file as the design system. |
| Wants to copy a site's look from a URL or screenshot | `hallmark` (design extraction), `design-md` |
| Wants a DESIGN.md or theme | `stitch-design-taste`, `taste-design`, `design-md`, `theme-factory` |
| Direction undecided | `21st-ui-explore` and/or `prototype` to compare options |
| Building real components | `21st-ui-build`, `21st-cli-use` (search before hand-writing), `shadcn-ui`, `pick-ui-library` |
| Portfolio, studio, launch or "must impress" site | `awwwards` (build to Site-of-the-Day bar) |
| Score or critique a live site or local build | `jury` (review only), then `web-design-guidelines` |
| Needs a diagram or chart (architecture, flow, timeline, Sankey, heatmap) | `diagram-design` |
| Playful interactive line-art figure, or an SVG logo/icon to make interactive | `hairline-create`, `hairline-adopt` |
| Promo, launch, explainer or social video; kinetic type; logo sting | start with `hyperframes` (router), then `motionmaxxing`, `motion-graphics`, `product-launch-video`, `hyperframes-core`, `hyperframes-animation`, `hyperframes-creative`, `hyperframes-keyframes`, `hyperframes-cli`; `animate-studio` if installed and the user has style references |
| Interactive deck or pitch | `slideshow` |
| Screenshot, mockup or reference image supplied | `image-to-code`; for no image yet, `imagegen-frontend-web` or `imagegen-frontend-mobile` first |
| Brand identity, logo, social or hero art needed | `brandkit`, `design`, `canvas-design` |
| Motion missing, janky or inconsistent | `find-animation-opportunities`, `animate`, `improve-animations`, `review-animations`, `animation-performance`, `animation-vocabulary` (React page transitions: `vercel-react-view-transitions`) |
| React / Next.js code | `vercel-react-best-practices`, `vercel-composition-patterns`, `frontend-ui-engineering` |
| Slow pages, heavy bundle | `performance-optimization`, `animation-performance` |
| Web app used on phones / PWA | `mobile-native` |
| Fragile with real data | `break-ui` |
| React Native / Expo | `vercel-react-native-skills`, `expo-design-system`, `expo-native-ui`, `expo-ui`, `expo-router`, `expo-animation` |
| SwiftUI / iOS / macOS | `swiftui-ui-patterns`, `swiftui-liquid-glass`, `swiftui-view-refactor`, `swiftui-performance-audit`, `write-swift` |
| Review or audit only | `web-design-guidelines`, `21st-ui-review`, `review-animations`, `break-ui` (read-only unless asked to fix) |

Write the **Skill Plan** as a short numbered list: skill name, one-line reason, in execution order. Show it to the user (a few lines), then proceed without waiting.

Typical order: direction and tokens first (quality bar, system, aesthetic), then components and layout, then motion, then platform engineering, then verification.

### Skill families: what they are and when to reach for them

- **Foundations** (`impeccable`, `apple-design`, `emil-design-eng`, `ui-ux-pro-max`, `frontend-design`, `design-system`): used on almost every job. They set the bar, the system and the feel.
- **Aesthetic direction** (Taste, Hallmark, High-end, Minimalist, Brutalist, Redesign, Stitch, DESIGN.md skills): choose one look. Use Hallmark or the Taste skills when the output looks generic.
- **Award-level sites** (`awwwards`, `jury`): build something immersive and judge it with the same bar. Use `jury` after any big site build for an honest score.
- **Image-driven design** (`image-to-code`, `imagegen-frontend-*`): when a picture should come before the code.
- **Components** (`21st-*`, `shadcn-ui`, `ui-styling`, `pick-ui-library`, `prototype`): search and compare before hand-writing components.
- **Graphics and illustration** (`diagram-design`, `hairline-*`, `brandkit`, `design`, `canvas-design`): visuals that are not the page itself.
- **Motion** (`animate`, `improve-animations`, `review-animations`, `find-animation-opportunities`, `animation-performance`, `animation-vocabulary`): motion inside a UI. For standalone motion pieces and videos use the next family.
- **Motion graphics and video** (HyperFrames skills, `motionmaxxing`, `animate-studio`): rendered MP4s and overlays. These need Node 22+ and ffmpeg; `hyperframes` checks this and routes to the right workflow.
- **Engineering, mobile, SwiftUI, verification**: platform correctness and the screenshot loop.

## Phase 3: Execute

Work through the plan. For each skill: load it, follow its instructions, apply them to the actual code. Keep one coherent design system throughout. If two skills disagree, the order of authority is: the user's request, the chosen aesthetic, `impeccable`, then the rest.

Always:
- Real content, not lorem ipsum. A real spacing scale and type scale. All the states (hover, focus, active, disabled, loading, empty, error).
- Respect the existing stack and components. Do not add a framework without saying so.
- Accessibility is required: contrast, keyboard use, labels, reduced motion.
- Use up-to-date library docs rather than memory when an API is unfamiliar (Context7 MCP if available, otherwise the official docs).

## Phase 4: Verify (never skip for visible UI)

1. Run it. Screenshot at 375, 768 and 1280 px (iOS: simulator).
2. Compare against the Status Report. Fix what is still wrong, re-screenshot. Do at least one full look-and-fix loop.
3. Run an audit pass: `web-design-guidelines` and/or `21st-ui-review`, `break-ui` for data edge cases, `review-animations` if motion was added.
4. Run the project's own build, lint and tests if they exist.

## Phase 5: Report

Finish in plain words, under 15 lines: the direction chosen and why, the skills used, what changed, what you verified (widths, audits, build), and anything left undone or that needs the user (for example a missing API key or an asset).
