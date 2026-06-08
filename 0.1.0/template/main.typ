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
)


= Test

#lorem(200)
@nordstrom2023comparisons
