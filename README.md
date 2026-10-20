# fulldesign

**One command that designs like a whole team.** Type `/fulldesign` in Claude Code and it audits your project, works out what is missing, picks the right skills from a library of about 75 design, graphics, motion and video skills, and applies them with a screenshot-and-fix loop.

It covers websites, web apps, React Native / Expo apps, native SwiftUI apps, plus graphics, diagrams, motion graphics and promo videos.

## What it does

1. **Audits first.** Reads your stack and code, screenshots the running app at phone, tablet and desktop widths, and writes a short status report: what exists, what is broken, what is missing.
2. **Chooses its own skills.** From the catalog below, it picks every skill that fits what the audit found (design system, aesthetic, components, motion, platform, performance) and writes a skill plan.
3. **Builds and verifies.** Loads those skills in order, applies them to your code, then re-screenshots, audits accessibility and edge cases, and runs your build and tests.

You never have to call the individual skills yourself.

## Install

Needs Node 18+, git and Python 3. Works on macOS and Linux.

```bash
curl -fsSL https://raw.githubusercontent.com/aaryavvatts-lab/fulldesign/main/scripts/install.sh | bash
```

Or from a clone:

```bash
git clone https://github.com/aaryavvatts-lab/fulldesign.git
cd fulldesign && ./scripts/install.sh
```

Options: `--dry-run` shows what would happen, `--fulldesign-only` installs only the `/fulldesign` skill itself.

Then restart Claude Code and run `21st login` once (free 21st.dev account) to enable the 21st skills.

## Use

In any project folder:

```
/fulldesign redesign the landing page, it looks generic
/fulldesign build a habit tracker app for iOS
/fulldesign audit this dashboard and fix the worst problems
```

## How it is built

This repo contains only the `fulldesign` conductor skill, a catalog, and an installer. **It does not copy anyone else's skills.** The installer downloads each skill from its original author's repository with the standard `npx skills` tool, so you always get their latest version under their own license. `skills.json` is the single list of everything used; `scripts/build_catalog.py` regenerates the catalog and the table below from it.

> Third-party skills run with your agent's permissions. The skills listed here were read and scanned before inclusion, but you should review anything you install.

## Skill catalog

<!-- CATALOG:START -->
### Foundations

| Skill | What it does | Use it when |
|---|---|---|
| [`impeccable`](https://github.com/pbakaus/impeccable/tree/HEAD/.agents/skills/impeccable) | A design-quality bar and anti-slop ruleset with commands to shape, critique, audit, polish, harden and animate any frontend interface. | Always; it is the quality bar. Run it to shape, critique, audit or polish any interface. |
| [`apple-design`](https://github.com/emilkowalski/skills/tree/HEAD/skills/apple-design) | Apple-style fluid, physical interface design from WWDC talks: springs, gestures, materials, typography, restraint. | Gestures, springs, sheets, translucent materials, typography; anything that should feel physical and Apple-like. |
| [`emil-design-eng`](https://github.com/emilkowalski/skills/tree/HEAD/skills/emil-design-eng) | Emil Kowalski's philosophy on UI polish, component design and the invisible details that make software feel great. | Polishing details: hover/press states, easing, component feel, the small things that separate good from great. |
| [`ui-ux-pro-max`](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/tree/HEAD/.claude/skills/ui-ux-pro-max) | Searchable design intelligence: 79 styles, 192 product palettes, 74 font pairings, 119 UX rules, 22 stacks, for web, mobile and desktop. | No design system yet. Search it for a palette, font pairing, style and UX rules matched to the product type. |
| [`frontend-design`](https://github.com/anthropics/skills/tree/HEAD/skills/frontend-design) | Anthropic's guidance for distinctive, intentional visual design instead of templated defaults. | Anything that looks like a default template; sets a distinctive aesthetic direction first. |
| [`design-system`](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/tree/HEAD/.claude/skills/design-system) | Three-layer design tokens (primitive, semantic, component), CSS variables, scales and component specs. | Before building many screens: define tokens (color, type, spacing, radius, motion) once. |
| [`web-design-guidelines`](https://github.com/vercel-labs/agent-skills/tree/HEAD/skills/web-design-guidelines) | Vercel's Web Interface Guidelines checklist for auditing accessibility, forms, focus, motion and UX in UI code. | Reviewing finished UI for accessibility, forms, focus, motion and content rules. |

### Aesthetic direction

| Skill | What it does | Use it when |
|---|---|---|
| [`design-taste-frontend`](https://github.com/Leonxlnx/taste-skill/tree/HEAD/skills/taste-skill) | Taste Skill v2: anti-slop art direction for websites with a real-browser inspector and a look-and-fix loop. | Public-facing pages that look generic or AI-made; use its look-and-fix screenshot loop. |
| [`high-end-visual-design`](https://github.com/Leonxlnx/taste-skill/tree/HEAD/skills/soft-skill) | Agency-grade premium look: exact fonts, spacing, shadows, cards and animation that feel expensive. | The brief says premium, luxury, agency-grade or expensive. |
| [`minimalist-ui`](https://github.com/Leonxlnx/taste-skill/tree/HEAD/skills/minimalist-skill) | Clean, editorial, quiet interfaces with restrained color and generous whitespace. | The brief says clean, editorial, calm, quiet or Notion/Linear-like. |
| [`industrial-brutalist-ui`](https://github.com/Leonxlnx/taste-skill/tree/HEAD/skills/brutalist-skill) | Raw, technical, brutalist interfaces with hard edges and bold typography. | The brief says raw, technical, brutalist or bold-typography. |
| [`redesign-existing-projects`](https://github.com/Leonxlnx/taste-skill/tree/HEAD/skills/redesign-skill) | Audits an existing site, finds generic AI patterns and upgrades it to premium without breaking functionality. | An existing site or app needs an upgrade without breaking it. |
| [`stitch-design-taste`](https://github.com/Leonxlnx/taste-skill/tree/HEAD/skills/stitch-skill) | Generates agent-readable DESIGN.md design-system files (Google Stitch style) with strict anti-generic rules. | You want a DESIGN.md that locks the system for later builds. |
| [`gpt-taste`](https://github.com/Leonxlnx/taste-skill/tree/HEAD/skills/gpt-tasteskill) | Editorial layouts with GSAP motion, bento grids and strict page structure for high-impact marketing pages. | Marketing pages that need editorial layout, bento grids and GSAP motion. |
| [`theme-factory`](https://github.com/anthropics/skills/tree/HEAD/skills/theme-factory) | Ten preset color and font themes, or a generated one, to style pages, slides and docs consistently. | Quick consistent color and font themes for pages, slides or docs. |
| [`brandkit`](https://github.com/Leonxlnx/taste-skill/tree/HEAD/skills/brandkit) | Creates brand-guidelines boards, logo systems and identity decks as images. | Brand-guidelines boards, logo systems and identity decks as images. |
| [`design`](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/tree/HEAD/.claude/skills/design) | Brand identity, logos, banners, icons, social images and slide decks in one toolkit. | Logos, banners, icons, social images, slides and brand identity. |
| [`canvas-design`](https://github.com/anthropics/skills/tree/HEAD/skills/canvas-design) | Original static visual art, posters and hero graphics as PNG or PDF. | A one-off poster, hero graphic or static artwork. |
| [`hallmark`](https://github.com/Nutlope/hallmark/tree/HEAD/skills/hallmark) | Anti-AI-slop design skill for new pages, audits, redesigns, and extracting a design system from a URL or screenshot. | Greenfield pages, audits and redesigns; also extracts a design system from a URL or screenshot you admire. |
| [`design-md`](https://github.com/google-labs-code/stitch-skills/tree/HEAD/skills/design-md) | Analyzes a design and writes a DESIGN.md design-system file agents can build against. | Capture an existing design into a DESIGN.md so every later build matches it. |
| [`taste-design`](https://github.com/google-labs-code/stitch-skills/tree/HEAD/skills/taste-design) | Stitch's taste skill: premium, anti-generic DESIGN.md rules for type, color, layout and micro-motion. | Writing a strict premium DESIGN.md (type, color, layout, micro-motion) from scratch. |

### Award-level websites

| Skill | What it does | Use it when |
|---|---|---|
| [`awwwards`](https://github.com/juliobsz/skills/tree/HEAD/awwwards) | Builds award-caliber sites from a one-line prompt: concept, art direction, typography, motion, WebGL, SEO, accessibility, browser QA. | You want a portfolio, studio or launch site that should look award-winning and immersive. |
| [`jury`](https://github.com/juliobsz/skills/tree/HEAD/jury) | Scores a live or local site like an Awwwards jury: screenshots, LCP/CLS/FPS, axe, keyboard focus, SEO, then a ranked fix list. | You want a site scored and critiqued (live URL or local build) with a ranked fix list. Review only, no edits. |

### Image-driven design

| Skill | What it does | Use it when |
|---|---|---|
| [`image-to-code`](https://github.com/Leonxlnx/taste-skill/tree/HEAD/skills/image-to-code-skill) | Generates or reads a design image first, analyzes it deeply, then builds the page to match it closely. | The user supplied a screenshot or mockup, or wants a design image made first and then built. |
| [`imagegen-frontend-web`](https://github.com/Leonxlnx/taste-skill/tree/HEAD/skills/imagegen-frontend-web) | Creates premium section-by-section website design reference images before coding. | Planning a landing page: generate section-by-section design references before any code. |
| [`imagegen-frontend-mobile`](https://github.com/Leonxlnx/taste-skill/tree/HEAD/skills/imagegen-frontend-mobile) | Creates app-native screen concepts and flows for iOS, Android and cross-platform apps. | Planning an app: generate screen concepts and flows before any code. |

### Components and inspiration

| Skill | What it does | Use it when |
|---|---|---|
| [`21st-ui-explore`](https://github.com/21st-dev/magic-mcp) | Explores several meaningfully different UI directions grounded in your design system and the 21st.dev catalog. | Direction is undecided; compare 2 to 3 distinct looks. |
| [`21st-ui-build`](https://github.com/21st-dev/magic-mcp) | Builds production UI from your project's components plus grounded 21st.dev inspiration. | Implementing a page or section with the project's real components plus catalog inspiration. |
| [`21st-ui-review`](https://github.com/21st-dev/magic-mcp) | Audits UI for design-system fit, accessibility, responsiveness and interaction quality, and fixes safe defects. | Auditing finished UI for accessibility, responsiveness and consistency; fixes safe issues. |
| [`21st-cli-use`](https://github.com/21st-dev/magic-mcp) | Searches and installs React/shadcn components, themes and templates from the 21st.dev catalog. | Before hand-writing a component: search the 21st.dev catalog and pull code. |
| [`ui-styling`](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/tree/HEAD/.claude/skills/ui-styling) | shadcn/ui, Radix and Tailwind patterns for accessible components, dark mode and themes. | Tailwind plus shadcn/ui implementation, dark mode and theming. |
| [`pick-ui-library`](https://github.com/emilkowalski/skills/tree/HEAD/skills/pick-ui-library) | Picks the right library for a frontend need (charts, OTP, command menus, drag and drop) from a curated list. | You need charts, OTP inputs, command menus, drag and drop or virtualization and want the right library. |
| [`prototype`](https://github.com/emilkowalski/skills/tree/HEAD/skills/prototype) | Builds several different versions of a UI piece behind a live picker so you can flip through and promote one. | You want several versions of one UI piece behind a live switcher to choose from. |
| [`shadcn-ui`](https://github.com/google-labs-code/stitch-skills/tree/HEAD/skills/shadcn-ui) | Finds, installs and customizes shadcn/ui components with best practices. | Adding or customizing shadcn/ui components in a project. |

### Graphics and illustration

| Skill | What it does | Use it when |
|---|---|---|
| [`diagram-design`](https://github.com/cathrynlavery/diagram-design/tree/HEAD/skills/diagram-design) | Branded diagrams and charts as HTML/SVG/PNG: architecture, flow, sequence, timelines, Sankey, heatmaps and 50+ more types. | You need a diagram or chart: architecture, flow, timeline, Sankey, heatmap and so on. |
| [`hairline-create`](https://github.com/lucasmarkes/hairline/tree/HEAD/skills/hairline-create) | Draws a new isometric line-art figure that reacts to the pointer, as one self-contained HTML file. | You want a playful isometric line-art figure that follows the cursor. |
| [`hairline-adopt`](https://github.com/lucasmarkes/hairline/tree/HEAD/skills/hairline-adopt) | Turns an existing SVG (icon, logo, illustration) into an interactive isometric Hairline figure. | You have an SVG logo or icon you want turned into that interactive figure. |

### Motion

| Skill | What it does | Use it when |
|---|---|---|
| [`animate`](https://github.com/emilkowalski/skills/tree/HEAD/skills/animate) | Builds an animation by deciding in order: whether to animate, purpose, properties, easing and fallback. | Adding or fixing one web animation (decides whether, why, which properties, easing). |
| [`improve-animations`](https://github.com/emilkowalski/skills/tree/HEAD/skills/improve-animations) | Audits a codebase's motion and produces a prioritized plan to improve it. | Audit a whole codebase's motion and get a prioritized plan. |
| [`review-animations`](https://github.com/emilkowalski/skills/tree/HEAD/skills/review-animations) | Reviews animation code against a high craft bar and flags what falls short. | Critique motion code in a diff or file. |
| [`find-animation-opportunities`](https://github.com/emilkowalski/skills/tree/HEAD/skills/find-animation-opportunities) | Finds places that should animate but don't, and rejects motion that shouldn't exist. | Find places that should animate and do not. |
| [`animation-performance`](https://github.com/emilkowalski/skills/tree/HEAD/skills/animation-performance) | Keeps web animation inside the frame budget with composite-only properties and off-main-thread motion. | Animation is janky or drops frames. |
| [`animation-vocabulary`](https://github.com/emilkowalski/skills/tree/HEAD/skills/animation-vocabulary) | Turns a vague description of an effect into its exact name and technique. | You can describe an effect but not name it. |
| [`vercel-react-view-transitions`](https://github.com/vercel-labs/agent-skills/tree/HEAD/skills/react-view-transitions) | Page and shared-element transitions with React's View Transition API. | Page or shared-element transitions in React or Next.js. |

### Motion graphics and video

| Skill | What it does | Use it when |
|---|---|---|
| [`motionmaxxing`](https://github.com/tejashmakwana/motionmaxxing) | Directs senior-level motion-graphics films (launches, promos, kinetic type) with brand capture, GSAP runtime and scripted quality gates. | A launch video, product promo, feature reveal, kinetic-type piece or social ad; also critiquing or fixing one. |
| [`hyperframes`](https://github.com/heygen-com/hyperframes/tree/HEAD/skills/hyperframes) | Entry point for HyperFrames: any video, animation or motion graphic written as HTML and rendered to MP4. | Start here for any video, motion graphic, captioned clip or HTML-to-MP4 request; it routes to the others. |
| [`hyperframes-core`](https://github.com/heygen-com/hyperframes/tree/HEAD/skills/hyperframes-core) | The HyperFrames composition contract: structure, timing attributes, tracks and deterministic rendering. | Writing or fixing a HyperFrames composition's HTML and timing. |
| [`hyperframes-animation`](https://github.com/heygen-com/hyperframes/tree/HEAD/skills/hyperframes-animation) | Motion rules, scene blueprints, transitions and runtime adapters (GSAP, Lottie, Three.js and more) for video. | Choosing animation rules, transitions and runtimes inside a video. |
| [`hyperframes-creative`](https://github.com/heygen-com/hyperframes/tree/HEAD/skills/hyperframes-creative) | Creative direction for video: palettes, typography, narration, beat planning and brand decisions. | Palette, type, narration and beat planning for a video. |
| [`hyperframes-keyframes`](https://github.com/heygen-com/hyperframes/tree/HEAD/skills/hyperframes-keyframes) | Camera moves, punch-ins, Ken Burns, SVG morph and 3D keyframes that stay seek-safe. | Zooms, camera moves, Ken Burns, SVG morphs in a video. |
| [`hyperframes-cli`](https://github.com/heygen-com/hyperframes/tree/HEAD/skills/hyperframes-cli) | The HyperFrames command line: init, lint, preview, render, doctor and cloud rendering. | Running, previewing, linting or rendering a HyperFrames project; diagnosing render errors. |
| [`motion-graphics`](https://github.com/heygen-com/hyperframes/tree/HEAD/skills/motion-graphics) | Short design-led motion graphics: kinetic type, stat count-ups, logo stings, lower thirds, animated maps and UI animation. | Under 30 seconds: kinetic type, stat count-ups, logo stings, lower thirds, animated maps. |
| [`product-launch-video`](https://github.com/heygen-com/hyperframes/tree/HEAD/skills/product-launch-video) | Turns a product URL, script or brief into a launch or promo video. | You have a product URL, script or brief and want a promo video. |
| [`slideshow`](https://github.com/heygen-com/hyperframes/tree/HEAD/skills/slideshow) | Builds an interactive HTML slide deck with fragments, branching and a presenter mode. | An interactive HTML deck or pitch with presenter mode. |
| `animate-studio` (manual) | Turns a style reference and a rough idea into a finished animated video where every frame is drawn in code (by @guipaulinooo). Not redistributed: see README. | An explainer or animated story from a style reference where every frame is drawn in code. |

### Web engineering

| Skill | What it does | Use it when |
|---|---|---|
| [`vercel-react-best-practices`](https://github.com/vercel-labs/agent-skills/tree/HEAD/skills/react-best-practices) | Vercel Engineering's React and Next.js performance rules. | Writing or reviewing React/Next.js code for performance. |
| [`vercel-composition-patterns`](https://github.com/vercel-labs/agent-skills/tree/HEAD/skills/composition-patterns) | Scalable React composition: compound components, render props, flexible component APIs. | Components with too many boolean props or a reusable component API to design. |
| [`frontend-ui-engineering`](https://github.com/addyosmani/agent-skills/tree/HEAD/skills/frontend-ui-engineering) | Production-quality, accessible, responsive UI: layout, state, WCAG and component structure. | Building production components: layout, state, WCAG, responsive structure. |
| [`performance-optimization`](https://github.com/addyosmani/agent-skills/tree/HEAD/skills/performance-optimization) | Measures and fixes performance and Core Web Vitals regressions. | Core Web Vitals, slow loads or regressions. |
| [`mobile-native`](https://github.com/emilkowalski/skills/tree/HEAD/skills/mobile-native) | The small CSS and meta-tag fixes that make a web app feel installed on a phone. | A web app or PWA used on phones that feels like a website. |
| [`break-ui`](https://github.com/emilkowalski/skills/tree/HEAD/skills/break-ui) | Stress-tests UI with worst-case data: long names, empty states, huge counts, missing fields. | Before shipping: stress-test with long names, empty and huge data. |

### Mobile apps (React Native / Expo)

| Skill | What it does | Use it when |
|---|---|---|
| [`vercel-react-native-skills`](https://github.com/vercel-labs/agent-skills/tree/HEAD/skills/react-native-skills) | React Native and Expo performance and best practices: lists, animation, native modules. | React Native / Expo performance, lists, native modules. |
| [`expo-design-system`](https://github.com/expo/skills/tree/HEAD/plugins/expo/skills/expo-design-system) | Design tokens, variant conventions and anti-slop rules for a consistent Expo app. | Setting up tokens and variants in an Expo app or fixing generic-looking screens. |
| [`expo-native-ui`](https://github.com/expo/skills/tree/HEAD/plugins/expo/skills/expo-native-ui) | Native-feeling Expo screens: Apple HIG, semantic colors, SF Symbols, native controls. | Making Expo screens feel native (HIG, SF Symbols, native controls). |
| [`expo-ui`](https://github.com/expo/skills/tree/HEAD/plugins/expo/skills/expo-ui) | Real SwiftUI and Jetpack Compose components from @expo/ui: sheets, pickers, menus, forms. | Sheets, pickers, menus and forms using real SwiftUI / Jetpack Compose. |
| [`expo-router`](https://github.com/expo/skills/tree/HEAD/plugins/expo/skills/expo-router) | File-based routing, native tabs, stacks, modals and headers in Expo Router. | Navigation, tabs, modals and headers in Expo. |
| [`expo-animation`](https://github.com/expo/skills/tree/HEAD/plugins/expo/skills/expo-animation) | Reanimated, gestures, sheets, transitions and haptics for Expo, decided in the right order. | Gestures, sheets, transitions and haptics in Expo. |

### Native iOS / macOS (SwiftUI)

| Skill | What it does | Use it when |
|---|---|---|
| [`swiftui-ui-patterns`](https://github.com/Dimillian/Skills/tree/HEAD/swiftui-ui-patterns) | SwiftUI patterns for navigation, tabs, stacks, grids and state. | Building SwiftUI screens, tabs and navigation. |
| [`swiftui-liquid-glass`](https://github.com/Dimillian/Skills/tree/HEAD/swiftui-liquid-glass) | Adopt and review the iOS 26 Liquid Glass API correctly. | Adopting the iOS 26 Liquid Glass look. |
| [`swiftui-view-refactor`](https://github.com/Dimillian/Skills/tree/HEAD/swiftui-view-refactor) | Cleans up SwiftUI views: small subviews, stable trees, correct Observation use. | Cleaning up large SwiftUI views. |
| [`swiftui-performance-audit`](https://github.com/Dimillian/Skills/tree/HEAD/swiftui-performance-audit) | Diagnoses slow rendering, janky scrolling and excess view updates in SwiftUI. | Janky scrolling or heavy view updates in SwiftUI. |
| [`write-swift`](https://github.com/emilkowalski/skills/tree/HEAD/skills/write-swift) | Modern Swift 6: value types, concurrency and data-race safety. | Writing or migrating modern Swift 6 code. |

### Verification

| Skill | What it does | Use it when |
|---|---|---|
| [`playwright-cli`](https://github.com/microsoft/playwright-cli) | Drives a real browser from the terminal to screenshot, click and test pages at any viewport. | Screenshots at 375/768/1280 and click-through checks of a running app. |
| [`browser-testing-with-devtools`](https://github.com/addyosmani/agent-skills/tree/HEAD/skills/browser-testing-with-devtools) | Inspects the DOM, console, network and performance in a real browser through Chrome DevTools. | Inspecting DOM, console, network and performance in a real browser. |

### Reference library

| Skill | What it does | Use it when |
|---|---|---|
| [`awesome-design-md`](https://github.com/VoltAgent/awesome-design-md/tree/HEAD/design-md) | 84 ready-made DESIGN.md files extracted from real brands (Stripe, Linear, Airbnb and more) to copy as a design system. | The user names a brand look; copy its DESIGN.md as the system. |
| [`awesome-claude-design`](https://github.com/VoltAgent/awesome-claude-design) | Index of 68 ready-made DESIGN.md design systems (brands) to hand to Claude as a design brief. | Same idea: browse 68 more brand DESIGN.md files and follow the links. |

<!-- CATALOG:END -->

## Extras that are not installed by the script

- **`animate-studio`** (by [@guipaulinooo](https://github.com/guipaulinooo)): turns a style reference and a rough idea into an animated MP4 drawn entirely in code. It has no public repo I could find and no license, so it is not redistributed here. If you have the skill folder, copy it to `~/.claude/skills/animate-studio/` and change `name: animate` to `name: animate-studio` in its `SKILL.md`, because [Emil Kowalski's `animate`](https://github.com/emilkowalski/skills) already uses that name. It needs Node 22+ and ffmpeg.
- **DESIGN.md Style Extractor** ([bergside/design-md-chrome](https://github.com/bergside/design-md-chrome)): a Chrome extension that exports any site's typography, colors, spacing and motion as a `DESIGN.md`. Load it unpacked from `chrome://extensions`, then give the file to `/fulldesign` as the design system.
- **thinking-orbs** ([Jakubantalik/thinking-orbs](https://github.com/Jakubantalik/thinking-orbs)): a React component set of animated "thinking" orbs for AI apps. It is a library, not a skill; `npm install` it when you need one.
- **Stitch skills that need the Stitch MCP** (`stitch-loop`, `enhance-prompt`, `site-md`) from [google-labs-code/stitch-skills](https://github.com/google-labs-code/stitch-skills): install them yourself if you use Google Stitch.

## Contributing

Know a great design skill that is missing? Open a PR that adds an entry to `skills.json` (name, source repo, path, one-line description), then run `python3 scripts/build_catalog.py`. Please only add skills that are public, have a clear license, and have been read for anything unsafe.

## Credits

All the skills belong to their authors: [Emil Kowalski](https://github.com/emilkowalski/skills), [Paul Bakaus (Impeccable)](https://github.com/pbakaus/impeccable), [Leonxlnx (Taste Skill)](https://github.com/Leonxlnx/taste-skill), [Anthropic](https://github.com/anthropics/skills), [Vercel](https://github.com/vercel-labs/agent-skills), [Expo](https://github.com/expo/skills), [Dimillian](https://github.com/Dimillian/Skills), [nextlevelbuilder](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill), [Nutlope (Hallmark)](https://github.com/Nutlope/hallmark), [juliobsz (Awwwards, Jury)](https://github.com/juliobsz/skills), [Tejash Makwana (Motionmaxxing)](https://github.com/tejashmakwana/motionmaxxing), [HeyGen (HyperFrames)](https://github.com/heygen-com/hyperframes), [Lucas Markes (Hairline)](https://github.com/lucasmarkes/hairline), [Cathryn Lavery (diagram-design)](https://github.com/cathrynlavery/diagram-design), [Google Labs (Stitch skills)](https://github.com/google-labs-code/stitch-skills), [Addy Osmani](https://github.com/addyosmani/agent-skills), [21st.dev](https://github.com/21st-dev/magic-mcp), [Microsoft](https://github.com/microsoft/playwright-cli) and [VoltAgent](https://github.com/VoltAgent/awesome-design-md).

## License

MIT for the files in this repo (see `LICENSE`). Each linked skill keeps its own license.
