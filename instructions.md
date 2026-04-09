# Task: Update YAML Front Matter in All Quarto Slide Decks

## Context

This is a Quarto project. The slide decks are `.qmd` files located in the `slides/` subfolder.
Each file has a YAML front matter block delimited by `---` at the top of the file.

## Objective

For every `.qmd` file in the `slides/` folder, update the `format: revealjs:` block in the YAML front matter by adding the following two lines:

```yaml
    embed-resources: true
    chalkboard: false
```

## Rules

1. **Find** all `.qmd` files recursively inside the `slides/` folder.
2. **Read** the YAML front matter of each file (everything between the opening `---` and closing `---`).
3. **Locate** the `format:` key, then within it the `revealjs:` sub-key.
4. **Add** `embed-resources: true` as a new line under `revealjs:`, respecting the existing indentation (2 spaces per level).
5. **Replace** `chalkboard: true` with `chalkboard: false` if it exists. If `chalkboard:` is absent, **add** `chalkboard: false` under `revealjs:`.
6. **Do not modify** anything outside the YAML front matter block.
7. **Do not modify** any other YAML keys.
8. **Preserve** all existing indentation, ordering, and formatting of the rest of the YAML.
9. If a file already has `embed-resources: true`, **skip** it (do not duplicate).
10. After editing, **report** which files were modified and which were skipped.

## Expected Result

Every `revealjs:` block should end up containing at minimum:

```yaml
format:
  revealjs:
    embed-resources: true
    chalkboard: false
    # ... all other existing keys unchanged ...
```

## Example

### Before

```yaml
---
title: "Producer Theory"
format:
  revealjs:
    theme: [default, custom.scss]
    transition: slide
    slide-number: true
    chalkboard: true
    scrollable: false
---
```

### After

```yaml
---
title: "Producer Theory"
format:
  revealjs:
    theme: [default, custom.scss]
    transition: slide
    slide-number: true
    chalkboard: false
    scrollable: false
    embed-resources: true
---
```

## Important Warnings

- `embed-resources: true` and `chalkboard: true` are **incompatible** in Quarto and will cause a render error. This is why `chalkboard` must be set to `false`.
- Do **not** use a YAML parser that strips comments — preserve any `#` comment lines in the front matter.
- Make a **dry run** first (print what would change without writing) and ask for confirmation before applying changes.