#let hsfdTemplate(
  titlePage: none,
  bibliography: none,
  appendix: none,
  aiUsage: none,
  declaration: none,
  abbreviations: none,
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
  show figure: set block(breakable: true)


  titlePage
  pagebreak()

  outline(title: "Inhaltsverzeichnis")
  pagebreak()

  context {
    if query(figure.where(kind: image)).len() > 0 {
      outline(title: [Abbildungsverzeichnis], target: figure.where(kind: image))
      pagebreak()
    }
    if query(figure.where(kind: table)).len() > 0 {
      outline(title: [Tabellenverzeichnis], target: figure.where(kind: table))
      pagebreak()
    }
    if query(figure.where(kind: raw)).len() > 0 {
      outline(title: [Listingverzeichnis], target: figure.where(kind: raw))
      pagebreak()
    }
  }

  // abbreviations: array of (short, long) pairs
  if abbreviations != none {
    heading(numbering: none, outlined: false)[Abkürzungsverzeichnis]
    table(
      columns: (auto, 1fr),
      stroke: none,
      align: left + top,
      ..abbreviations.map(a => (strong(a.at(0)), a.at(1))).flatten(),
    )
    pagebreak()
  }

  set page(numbering: "1")
  counter(page).update(1)

  body

  pagebreak()
  bibliography

  // appendix: array of content blocks; each starts on a new page and is numbered A., B., ...
  if appendix != none {
    counter(heading).update(0)
    set heading(numbering: none, outlined: false)
    show heading.where(level: 1): set heading(numbering: "A.", outlined: true, supplement: [Anhang])
    for item in appendix {
      pagebreak()
      item
    }
  }

  if aiUsage != none {
    pagebreak()
    heading(numbering: none)[Dokumentation der verwendeten KI-Werkzeuge]
    aiUsage
  }

  // Wortlaut der Studienbüro-Vorlage, Stand November 2025
  if declaration != none {
    pagebreak()
    heading(numbering: none)[Eigenständigkeitserklärung]
    grid(
      columns: (auto, 1fr),
      column-gutter: 1em,
      row-gutter: 0.8em,
      [Name, Vorname:], [#declaration.name],
      [Matrikel-Nr.:], [#declaration.matriculation],
      [Studiengang:], [#declaration.program],
      [Modul:], [#declaration.module],
    )
    [
      Hiermit versichere ich, dass ich die Prüfungsleistung bzw. Abschlussarbeit in o.g. Modul -- bei einer Gruppenarbeit den entsprechend gekennzeichneten Anteil der Arbeit -- selbständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel verwendet habe. Die aus fremden Quellen direkt oder indirekt übernommenen Texte, Gedankengänge, Konzepte, Grafiken usw. in meinen Ausführungen habe ich als solche eindeutig gekennzeichnet und mit vollständigen Verweisen auf die jeweilige Quelle versehen.

      #if aiUsage != none [
        Alle Zitate sowie alle Abschnitte, die durch den Einsatz von KI-basierten Tools verfasst oder modifiziert wurden, sind auf ihre Korrektheit überprüft worden. Eine Dokumentation der verwendeten KI-Werkzeuge mit ihrem Verwendungszweck liegt der Arbeit bei.
      ]

      Für die Qualität und sämtliche Inhalte der vorliegenden Arbeit trage ich die Verantwortung und mein gestalterischer Einfluss überwiegt.

      #if aiUsage != none [
        Ich versichere weiterhin, dass ich ausschließlich KI-gestützte Tools verwendet habe, deren Nutzung die prüfende Person explizit als zugelassenes Hilfsmittel ausgewiesen hat.
      ]

      Die Arbeit wurde in gleicher oder ähnlicher Form noch in keiner anderen Prüfung vorgelegt.
    ]
    v(2cm)
    grid(
      columns: (1fr, 1fr),
      column-gutter: 1cm,
      row-gutter: 0.2cm,
      align: bottom,
      [#declaration.place, den #declaration.date], declaration.at("signature", default: []),
      line(length: 100%), line(length: 100%),
      [Ort, Datum], [Unterschrift],
    )
  }
}
