# generate-pdf

A small Bash script that converts a Markdown file into a styled PDF using
[Pandoc](https://pandoc.org/) and [LibreOffice](https://www.libreoffice.org/).

The conversion happens in two steps:

1. `pandoc` converts the Markdown file to ODT, applying the styles defined in
   `ref-doc.odt` as the reference document.
2. LibreOffice (headless) converts the ODT to PDF and the script opens the
   result.

## Requirements

- macOS (the script invokes LibreOffice from `/Applications/LibreOffice.app`)
- [Pandoc](https://pandoc.org/)
- [LibreOffice](https://www.libreoffice.org/)
- The reference document `ref-doc.odt` (kept alongside `generate.sh` in the same folder)

## Installation

### Install Pandoc

Using [Homebrew](https://brew.sh/):

```bash
brew install pandoc
```

Alternatively, download the macOS installer from the
[Pandoc releases page](https://github.com/jgm/pandoc/releases).

### Install LibreOffice

Using Homebrew Cask:

```bash
brew install --cask libreoffice
```

Alternatively, download the macOS package from
[libreoffice.org/download](https://www.libreoffice.org/download/download/).

### Make the script executable

From the project directory, give `generate.sh` execute permission:

```bash
chmod +x generate.sh
```

### Reference document

The script loads `ref-doc.odt` from the same directory as `generate.sh`, so no
additional setup is required as long as the two files stay together. Edit
`ref-doc.odt` in LibreOffice to customise fonts, headings, margins, etc.

## Usage

```bash
./generate.sh path/to/file.md
```

The generated PDF is written to `$HOME/Downloads/doc.pdf` and opened
automatically.

### Try it with the included test file

A `test.md` file is included in this repository to exercise common Markdown
elements (headings, lists, code blocks, tables, block quotes, etc.). Use it to
verify your setup and to preview how the styles in `ref-doc.odt` render:

```bash
./generate.sh test.md
```

### Optional: add to your PATH

To run the script from anywhere, place it on your `PATH`, for example:

```bash
ln -s "$PWD/generate.sh" /usr/local/bin/generate-pdf
generate-pdf path/to/file.md
```

## How it works

- Markdown is parsed with the `markdown+grid_tables+multiline_tables` Pandoc
  reader, so grid- and multiline-style tables are supported.
- Output styling (fonts, headings, margins, etc.) is controlled by editing
  `ref-doc.odt` in LibreOffice — no template syntax required.

## Customising styles (`ref-doc.odt`)

`ref-doc.odt` is a regular ODT document that Pandoc uses as a *style template*.
Pandoc copies the document's named paragraph and character styles into the
generated ODT, so any change you make to a style in `ref-doc.odt` is reflected
in every PDF you generate afterwards.

### Editing styles in LibreOffice

1. Open the file:

   ```bash
   open ref-doc.odt
   ```

2. Open the Styles sidebar with **F11** (or **Format → Styles → Manage Styles**).
3. Right-click a style and choose **Modify…** to change fonts, sizes, spacing,
   colors, indentation, borders, etc. The styles Pandoc maps to are mostly
   self-describing, for example:

   - `Default Paragraph Style` — body text
   - `Title`, `Subtitle`
   - `Heading 1` … `Heading 6`
   - `Quotations` — block quotes
   - `Preformatted Text` — fenced code blocks
   - `Source Text` — inline code
   - `List Bullet`, `List Number` — list items
   - `Table Contents`, `Table Heading` — table cells
   - `Footnote`, `Caption`, `Figure`

4. To change page size, margins, or headers/footers, use
   **Format → Page Style…**.
5. **Save the file as ODT** (keep the `.odt` extension; do not "Save As" to
   another format). Close LibreOffice.

### Apply the changes

Just re-run the script — no other steps are needed:

```bash
./generate.sh test.md
```

### Tips

- Only the *styles* are copied from `ref-doc.odt`; any actual text content in
  the file is ignored by Pandoc, so you can leave sample paragraphs in there to
  preview how each style looks while editing.
- If a style you expect to change has no effect, check that you edited the
  named style itself (not just applied direct formatting to a paragraph).
- Keep a backup of `ref-doc.odt` before making large changes, e.g.:

  ```bash
  cp ref-doc.odt ref-doc.odt.bak
  ```

- For a fresh starting point with all Pandoc-relevant styles defined, you can
  regenerate a default reference doc with:

  ```bash
  pandoc -o ref-doc.odt --print-default-data-file reference.odt
  ```

## Troubleshooting

- **`Error: pandoc is not installed....`** — install Pandoc (see above) and
  ensure `pandoc` is on your `PATH`.
- **`soffice: command not found` / nothing happens** — confirm LibreOffice is
  installed at `/Applications/LibreOffice.app`. If installed elsewhere, edit
  the path in `generate.sh`.
- **Reference doc not found** — make sure `ref-doc.odt` is in the same folder
  as `generate.sh`.
