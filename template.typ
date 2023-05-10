// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(header: [
    #align(right)[#counter(page).display()]
  ])


  // Save heading and body font families in variables.
  let body-font = "Times New Roman"

  let sans-font = "Noto Sans"

  // Set body font family.
  set text(font: body-font, lang: "en", size: 12pt, weight: 500)

  set heading(numbering: "1.1")

  // Set paragraph spacing.
  show par: set block(above: 2em, below: 2em)

  show heading: set text(font: sans-font)
  set par(leading: 2em, first-line-indent: 2em)

  // Title row.
  align(center)[
    #block(text(font: sans-font, weight: 700, 1.75em, title))
  ]

  // Author information.
  pad(
    top: 0.8em,
    bottom: 0.8em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, strong(author))),
    ),
  )

  // Main body.
  set par(justify: false)

  body
}