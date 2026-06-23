#let hsfdTemplate(
  titlePage: none,
  bibliography: none,
  body,
) = {
  set heading(numbering: "1.1.")
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "de",
    region: "de",
    hyphenate: true,
  )
  set par(leading: 0.5em, justify: true)
  set page(numbering: none)
  set page(
    paper: "a4",
    margin: (left: 3cm, right: 2.5cm, top: 2.5cm, bottom: 2.5cm),
  )

  show heading: set block(
    below: 2em,
  )


  titlePage
  pagebreak()

  outline(title: "Inhaltsverzeichnis")
  pagebreak()

  context {
    if query(figure).len() > 0 {
      outline(
        title: [Abbildungsverzeichnis],
        target: figure,
      )
      pagebreak()
    }
  }

  set page(numbering: "1")
  counter(page).update(1)

  body

  pagebreak()
  bibliography
}
