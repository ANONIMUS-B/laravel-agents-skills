---
name: agent-browser
description: Use agent-browser to navigate and inspect websites, interact with forms, capture screenshots, and perform browser-based application testing when this CLI is available and appropriate for the task.
license: MIT
metadata:
  source: https://github.com/vercel-labs/agent-browser
---

# Agent Browser

Use the [agent-browser CLI](https://github.com/vercel-labs/agent-browser) for browser automation. This skill supplies instructions; it does not install the CLI or its browser.

Before using the CLI, check that it is installed and run `agent-browser skills get core` to load the guide matching the installed version. If it is missing and the user wants to use it, follow the project's installation instructions:

```bash
npm install -g agent-browser
agent-browser install
```

For a typical browser task:

1. Open the target with `agent-browser open <url>`.
2. Run `agent-browser snapshot -i` to inspect interactive elements.
3. Use the current element references to interact, for example `agent-browser click @e1`.
4. Take another snapshot after navigation or page changes, and verify the result.
5. Close the browser with `agent-browser close` when finished.

Use `agent-browser --help` or the version-matched core guide for further commands. For Laravel applications, this can help inspect local pages and check user flows; use appropriate test data and respect the user's authorization for actions that change data.
