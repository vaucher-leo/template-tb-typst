# template-tb-typst
Template de TB en Typst

# Usage

To use this template, first edit the config.typ file with your informations and change the language in the main.typ if you want it in English.

# Compiling

## VS Code

To use it in VS Code, just install theses extensions:
- Typst LSP (id: nvarner.typst-lsp )
- Typst Preview (id: mgt19937.typst-preview )

With theses extensions, I recommend you to change the settings of Typst LSP to export PDF only on pinned main save and to set the main file to main.typ. To set that, just open the main.typ file, go to the command palette and choose
"Pin the main file to the currently oppening document".
To get a fast preview and the ability to go from pdf to code, use the Typst preview located on the top right corner.

## Typst website

Import all the files in a project on their editor on the website and it works! (Thanks to Florian for testing)

# Languages

This template is available in 2 languages: French and English. To use one or another version, just change the import in the main.typ file to the correct template with either "FR" or "EN" in it's name.