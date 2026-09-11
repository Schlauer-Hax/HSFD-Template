#import "@local/HSFD-Template:0.1.0": hsfdTemplate
#import "titlePage.typ": titlePage
#show: hsfdTemplate.with(
  titlePage: titlePage(
    "AUTHOR",
    lorem(10),
    lorem(50),
    lorem(3),
    "Angewandte Informatik",
    "xx.xx.xxxx",
  ),
  bibliography: bibliography("bibliography.bib", title: "Quellenverzeichnis"),
  // aiUsage: [Welche KI-Werkzeuge wofür verwendet wurden],
  declaration: (
    name: "NACHNAME, VORNAME",
    matriculation: "XXXXXXX",
    program: "Angewandte Informatik",
    module: "MODUL",
    place: "Fulda",
    date: "xx.xx.xxxx",
    // signature: image("assets/unterschrift.svg", width: 5cm),
  ),
)


= Test

#lorem(200)
@nordstrom2023comparisons
