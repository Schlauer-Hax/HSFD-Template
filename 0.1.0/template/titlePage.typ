#let titlePage(
author,
shortTitle,
longTitle,
description,
courseOfStudy,
date
) = {
    align(center + top)[
        Hochschule Fulda \
        University of Applied Science
        #image("./assets/images/hs-fulda_logo_rund_gruen-schwarz_keinhintergrund_keineschutzzone_300ppi.png", height: 5cm)
    ]

    align(center + horizon)[
        #set text(1.2em)
        #text(24pt)[
            #{ shortTitle }
        ] \
        \
        #par(leading: 1em)[
        #text[
            #{ longTitle }
            ]
        ]
        \
        \
        Autor: \
        #{ author } \
        \
        #text(1.3em)[#{description}] \
        im Studiengang: #{courseOfStudy}
    ]

    align(center + bottom)[
        Einreichung: #{ date }
    ]
}

