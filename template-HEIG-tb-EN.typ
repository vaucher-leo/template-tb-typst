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
    lang: "en", 
    size: 12pt,)
  set heading(numbering: "1.1   ")
  show heading: it => [
    #set text(weight: 600, size: 20pt)
    #block(v(4.5cm) + it.body + v(1cm))
  ]

  // Table of contents.
  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    text(weight: 550 ,v(0.3cm) + it)
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
  align(center, text(1.1em, weight: 600, "Bachelor Thesis"))
  
  // Confidentiel
  v(4em)
  if confidential {
    align(center, text(1.1em, weight: 600, "CONFIDENTIAL"))
  }
  else {
    align(center, text(1.1em, weight: 600, " "))
  }

  // Département
  v(4em)
  align(center, text(1em, weight: 370, departement + " Department"))

  // Filière
  align(center, text(1em, weight: 370, filiere + " Sector"))

  // Orientation
  align(center, text(1em, weight: 370, orientation + " Orientation"))

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
  align(center, text(1em, weight: 370, "Supervised by :\n" + professor + " (HEIG-VD)"))

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
            box(width: 1fr, align(right,text(size: 11pt, "CONFIDENTIAL")))
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
    "Preamble" 
  )

  text("This Bachelor's thesis (hereinafter " + strong("TB") + ") is produced at the end of the course of study, with a view to obtaining the title of Bachelor of Science HES-SO in Engineering.\nAs an academic work, its content, without prejudging its value, does not engage the responsibility of the author, the Bachelor's thesis jury and the School.\nAny use, even partial, of this TB must respect copyright.")

  v(4em)
  move(
    dx: 10cm,
    text("HEIG-VD\nHead of Department")
  )

  v(6cm)
  text("Yverdon-les-Bains, " + date)

  pagebreak(to: "odd")

  // Authentication
  heading(
    numbering: none,
    outlined: true,
    "Authentication" 
  )

  text("I, " + authors + ", hereby certify that I produced this work on my own and did not use any sources other than those expressly mentioned.")

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
  text("Yverdon-les-Bains, " + date)

  pagebreak(to: "odd")

  outline(depth: 3, indent: true, title: v(-1cm) + "Table of contents")

  pagebreak(to: "odd")

  // Rest of document

  show heading: it => [
    #set text(weight: 600, size: 20pt)
    #block(v(1cm) + it.body + v(1cm))
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
            #box(width: 1fr, align(right,text(size: 11pt, "CONFIDENTIAL")))
        ] else [
            #box(width: 1fr, align(left,text(size: 11pt, "CONFIDENTIAL")))
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