# Test Document

This file exercises common Markdown elements so you can verify that
`generate.sh` produces a correctly styled PDF.

## Headings

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

## Paragraphs and inline formatting

This is a regular paragraph with **bold text**, *italic text*,
***bold and italic***, ~~strikethrough~~, `inline code`, and a
[link to Pandoc](https://pandoc.org/).

A second paragraph follows after a blank line. Here is a footnote
reference[^1] and a manual line break  
right here.

[^1]: This is a footnote.

## Block quote

> "The best way to predict the future is to invent it."
>
> — Alan Kay

Nested quote:

> Outer quote.
>
> > Inner quote.

## Lists

### Unordered

- First item
- Second item
  - Nested item
  - Another nested item
- Third item

### Ordered

1. Step one
2. Step two
   1. Sub-step
   2. Sub-step
3. Step three

### Task list

- [x] Write the script
- [x] Add a README
- [ ] Conquer the world

## Code

Inline: `printf "hello\n"`

Fenced block with syntax hint:

```bash
#!/bin/bash
echo "Generating PDF..."
pandoc -f markdown -t odt -o out.odt input.md
```

```python
def greet(name: str) -> str:
    return f"Hello, {name}!"
```

## Tables

### Pipe table

| Item       | Quantity | Price |
|------------|---------:|------:|
| Apples     |        3 |  1.20 |
| Bread      |        1 |  2.50 |
| Coffee     |        2 |  4.00 |

### Grid table

+---------------+---------------+--------------------+
| Fruit         | Color         | Notes              |
+===============+===============+====================+
| Apple         | Red / Green   | Crunchy            |
+---------------+---------------+--------------------+
| Banana        | Yellow        | Soft, sweet        |
+---------------+---------------+--------------------+
| Blueberry     | Blue          | Small, antioxidant |
+---------------+---------------+--------------------+

### Multiline table

-----------------------------------------------------
 Centered    Default          Right        Left
  Header     Aligned        Aligned      Aligned
----------- --------- --------------- ---------------
   First    row text         12.0000        example
            wraps to
            two lines

  Second     short            5.5000          short
-----------------------------------------------------

## Horizontal rule

---

## Definition list

Pandoc
:   A universal document converter.

LibreOffice
:   A free and open-source office productivity suite.

## Math (if supported)

Inline: $E = mc^2$

Block:

$$
\int_{0}^{\infty} e^{-x^2}\,dx = \frac{\sqrt{\pi}}{2}
$$

## Mixed content

1. A list item containing a code block:

   ```bash
   echo "nested in a list"
   ```

2. A list item with a quote:

   > Quoted inside a list.

3. A list item with a table:

   | Key | Value |
   |-----|-------|
   | a   | 1     |
   | b   | 2     |
