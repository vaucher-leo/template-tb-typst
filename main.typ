// Main File

#import "template-HEIG-tb-FR.typ": * // Replace FR with EN for EN Language
#import "fonctions.typ": *

#import "config.typ": *

#show: project.with(
  title: title,
  authors: author,
  professor: professor,
  departement: departement,
  filiere: filiere,
  orientation: orientation,
  field: field,
  date: todayDate("FR"),
  confidential: confidential,
)


// Main body.

#include "page/Introduction.typ"

#sys

= Théorie
#lorem(20)

Exemple de bibliographie @Typst

= Simulations
#lorem(40)

= Mesures
#lorem(10)

= Analyse
#lorem(132)

= Conclusion
#lorem(200)

#bibliography("bibliography.yml")