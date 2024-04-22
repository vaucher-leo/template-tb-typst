// Template for Bachelor's thesis of the HEIG-VD
// Author: Leo Vaucher
// Date: 07.03.2024
// Version: 1.0
//
// Brief:
// This template is based on the LaTex template of the HEIG-VD
// available on GitHub. It is just the styling with some modifications
// but the complex makefile with all the complicated things has not
// been done and will not be for now.

#let project(
  title: "",
  authors: (),
  professor: "",
  departement: "",
  filiere: "",
  orientation: "",
  field: "",
  date: none,
  logoHeig: "images/HEIG-VD.svg",
  logoHesso: "images/hes-so.svg",
  signatureFile: "images/signature.png",
  confidential: false,
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(numbering: none)
  set par(justify: true)
  set text(
    font: "Source Sans Pro",
    lang: "fr", 
    size: 12pt,)
  set heading(numbering: "1.1   ")
  show heading.where(
  level: 1
  ): it => [
    #set text(weight: 600, size: 20pt)
    #block(v(4.5cm) + it + v(1cm))
  ]
  show heading.where(
  level: 2
  ): it => [
    #set text(weight: 600, size: 15pt)
    #block(v(0cm) + it + v(0.5cm))
  ]

  // Table of contents.
  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    text(weight: 550 ,v(0.1cm) + it)
  }
  show outline.entry.where(
    level: 2
  ): it => {
    it
  }
  set outline(
    fill: text(
      weight: 350 ,
      h(0.5em) + box(width: 1fr, repeat("." + h(0.3em))) + h(0.2em)
    )
  )

  // Title page.

  // Logo HEIG-VD
  if logoHeig != none {
    pad(
      left: 0cm,
      top: 0cm, 
      image(logoHeig, height: 2cm)
    )
  }

  // Logo HES-SO
  if logoHesso != none {
    place(
      (right + bottom),
      move(
        dy: 0.8cm,
        image(logoHesso, height: 1cm)
      )
    )
  }

  // Title
  v(3cm)
  align(center, text(2em, weight: 600, title))

  // Travail de Bachelor
  v(-0.4cm)
  align(center, text(1.1em, weight: 600, "Travail de Bachelor"))
  
  // Confidentiel
  v(4em)
  if confidential {
    align(center, text(1.1em, weight: 600, "CONFIDENTIEL"))
  }
  else {
    align(center, text(1.1em, weight: 600, " "))
  }

  // Département
  v(4em)
  align(center, text(1em, weight: 370, "Département " + departement))

  // Filière
  align(center, text(1em, weight: 370, "Filière " + filiere))

  // Orientation
  align(center, text(1em, weight: 370, "Orientation " + orientation))

  // Author
  v(4.5em)
  text(
    1em,
    weight: 370,
    align(
      center,
      authors,
  ))

  // Date
  v(0.5em)
  align(center, text(1em, weight: 370, date))

  // Supervisor
  v(3.5cm)
  align(center, text(1em, weight: 370, "Supervisé par :\n" + professor + " (HEIG-VD)"))

  pagebreak(to: "odd")

  // Preamble
  set page(
    numbering: "i",
    number-align: center,
    footer: locate(loc => {
      let currentpage = loc.page()

      if calc.odd(currentpage) [
          #if confidential {
            box(width: 1fr)
            counter(page).display("i")
            box(width: 1fr, align(right,text(size: 11pt, "CONFIDENTIEL")))
          } else {
            align(center, counter(page).display("i"))
          }
      ] else [
          #h(1fr)
      ]
    })
  )
  counter(page).update(1)

  heading(
    numbering: none,
    outlined: true,
    "Préambule" 
  )

  text("Ce travail de Bachelor (ci-après " + strong("TB") + ") est réalisé en fin de cursus d'études, en vue de l'obtention du titre de Bachelor of Science HES-SO en Ingénierie.\nEn tant que travail académique, son contenu, sans préjuger de sa valeur, n'engage ni la responsabilité de l'auteur, ni celles du jury du travail de Bachelor et de l'École.\nToute utilisation, même partielle, de ce TB doit être faite dans le respect du droit d'auteur.")

  v(4em)
  move(
    dx: 10cm,
    text("HEIG-VD\nLe Chef du Département")
  )

  v(6cm)
  text("Yverdon-les-Bains, le " + date)

  pagebreak(to: "odd")

  // Authentication
  heading(
    numbering: none,
    outlined: true,
    "Authentification" 
  )

  text("Je soussigné, " + authors + ", atteste par la présente avoir réalisé seul ce travail et n'avoir utilisé aucune autre source que celles expressément mentionnées.")

  v(5cm)
  move(
    dx: 10cm,
    text(authors)
  )
  move(
    dx: 10cm,
    dy: -0.3cm,
    image("images/signature.png", height: 2cm)
  )

  v(4cm)
  text("Yverdon-les-Bains, le " + date)

  // Reset Firt title margin
  show heading.where(
  level: 1
  ): it => [
    #set text(weight: 600, size: 20pt)
    #block(v(0cm) + it.body + v(0.5cm))
  ]

  pagebreak(to: "odd")

  // CDC
  heading(
    numbering: none,
    outlined: true,
    "Cahier des charges"
  )

  include "page/Specifications.typ"

  pagebreak(to: "odd")

  // Resume
  heading(
    numbering: none,
    outlined: true,
    "Résumé"
  )

  include "page/Summary.typ"

  pagebreak(to: "odd")

  v(1cm)
  outline(depth: 3, indent: true, title: v(-1cm) + "Table des matières")

  pagebreak(to: "odd")

  // Rest of document

  show heading.where(
  level: 1
  ): it => [
    #set text(weight: 600, size: 20pt)
    #block(v(0.5cm) + it.body + v(0.5cm))
  ]
  show heading.where(
  level: 2
  ): it => [
    #set text(weight: 600, size: 15pt)
    #block(v(0cm) + it + v(0.5cm))
  ]

  set page(
    numbering: "1",
    number-align: center,
    footer: locate(loc => {
      let currentpage = loc.page()
      if confidential {
        if calc.odd(currentpage) [
            #box(width: 1fr)
            #counter(page).display("1")
            #box(width: 1fr, align(right,text(size: 11pt, "CONFIDENTIEL")))
        ] else [
            #box(width: 1fr, align(left,text(size: 11pt, "CONFIDENTIEL")))
            #counter(page).display("1")
            #box(width: 1fr)
        ]
      } else {
        align(center, counter(page).display("1"))
      }
    })
  )

  counter(page).update(1)

  body
}