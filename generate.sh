#!/bin/bash

show_help () {
cat <<script_help
  ================================================================
  Usage: $0 <markdown-file> <ref-doc>

  Options:

  -h, --help  :  Show this screen

  ================================================================
script_help
}

odt_path="/tmp/doc.odt"
pdf_path="$HOME/Downloads/doc.pdf"

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
  show_help && exit 0
fi

if [ -z "$1" ]; then
  printf "\033[31mError: No markdown file provided.\033[0m\nUsage: $0 <markdown-file>\n" && exit 1
fi

if [ -z "$2" ]; then
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  ref_doc="$script_dir/ref-doc.odt"
else 
  ref_doc=("$2")
  echo "Using: $1 as a reference document..."
fi

which pandoc > /dev/null && echo "Generating PDF from markdown...$1" || \
  (printf "\033[31mError: pandoc is not installed....\033[0m" && exit 1)

pandoc --reference-doc="$ref_doc" -f \
  markdown+grid_tables+multiline_tables -t odt -o $odt_path "$1" && \
  /Applications/LibreOffice.app/Contents/MacOS/soffice --headless \
  --convert-to pdf:writer_pdf_Export $odt_path --outdir "$HOME/Downloads" \
  && open $pdf_path

exit 0

