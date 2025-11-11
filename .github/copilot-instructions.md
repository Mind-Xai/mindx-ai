## Repository overview

This repository currently contains only high-level project metadata (see `README.md` and `LICENSE`). There is no application source code, test suite, or build configuration present at the time of writing.

Guide for AI coding agents working in this repo

- Look first at `README.md` for the project's stated purpose: "Ethical AI automation and SaaS deployment platform for nonprofits and developers." Use that as the source of truth for high-level intent.
- If you need code, tests, or infra to act on, open a short clarifying question for the maintainers (example questions below).

What to do when the repo is empty or minimal

- Confirm current contents: `README.md`, `LICENSE`. If other files are added later, re-run a quick search for `package.json`, `pyproject.toml`, `requirements.txt`, `Dockerfile`, `src/`, or `cmd/` to detect language and build system.
- If asked to implement a feature, propose a small scaffold and include a README update and minimal tests. Offer multiple sensible stacks (Node, Python, Go) and ask which the maintainers prefer.

Project-specific actionable patterns (discoverable now)

- Branch: default branch is `main`. Use feature branches named `feat/<short-desc>` or `fix/<issue-number>` and create PRs against `main` unless instructed otherwise.
- Owner: repository owner is `Mind-Xai`. If you need to reference stakeholders in PRs or commit messages, mention the org.

Examples of useful clarifying questions for maintainers (use these verbatim when needed)

- "This repo currently has only `README.md` and `LICENSE`. Which language, framework, and CI system should I scaffold for? (e.g. Node + GitHub Actions, Python + pytest, Docker + Make)"
- "Do you have an existing architecture diagram, deployment target (Heroku/GCP/Azure/AWS), or infra repo I should integrate with?"
- "Are there any style guides, linting rules, or license constraints I should follow beyond the `LICENSE` file?"

When scaffolding: include these minimal artifacts

- A short `README.md` update describing the scaffold purpose and how to run tests locally.
- A minimal build/test workflow (e.g., `/.github/workflows/ci.yml`) that runs lint and tests for the chosen stack.
- A single, fast unit test demonstrating the convention for tests (pytest/unittest/Jest).

Behavioral rules for AI edits in this repository

- Never add large, opinionated code without confirmation — present 1–2 scaffold options and ask which to proceed with.
- Keep commits small and reversible; include a brief commit message explaining intent and files changed.
- Reference actual files when making suggestions (e.g., "I will add `pyproject.toml` and `src/__init__.py`"), not abstract patterns.

Where to look next (priority order)

1. Any new top-level manifests: `package.json`, `pyproject.toml`, `requirements.txt`, `go.mod`.
2. `src/` or `app/` directories for source code and typical run entrypoints.
3. `.github/` for workflows and policy files to follow.

If you (maintainer) want me to populate a scaffold now, respond with your preferred stack and CI, or tell me to pick a default (I can propose Node + GitHub Actions or Python + pytest).

---
Please review this file. If any project-specific workflows or existing infra exist elsewhere (other repos, docs, or a private wiki), paste links or files and I'll merge them into these instructions.
