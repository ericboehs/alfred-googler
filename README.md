# Alfred Googler

An Alfred workflow for instantly searching Google using [googler](https://github.com/jarun/googler).

![demo gif](demo.gif)

## Installation

1. Ensure you have `googler` installed via `brew install googler`.
2. Download and open [this Workflow](https://github.com/ericboehs/alfred-googler/raw/master/Alfred%20Googler.alfredworkflow).
3. Set the workflow as your default fallback search in Alfred.
   - Features > Default Results > Setup fallback results > + > Workflow Triggers > Instantly search...
   - Drag it to the top of the list.

## Features
- Navigate directly to result via `Enter` or `Cmd-[Num]`.
- Displays host domain and article date (if present).
- Quicklook results by tapping `Shift`.
   - Use `PgUp` and `PgDown` keys to scroll.
   - Use `Up` and `Down` (or `Ctrl-P`/`Ctrl-N`) to go to next result without closing quicklook.
- Hold `Option` to expand truncated title.
- Hold `Cmd` to see full URL.
- Copy URL to clipboard with `Cmd-C`.
- Prefix `googler` arguments to search query to filter results (e.g. `-t y1` to only show results from the past year)
