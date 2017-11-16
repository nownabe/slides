#!/bin/bash

ignores=".git|reveal.js|template"

slides=$(find . -maxdepth 1 -type d | egrep -v "^\./($ignores)$|^\.$" | sort)

# echo $slides

list=""

for slide in $slides; do
  list="$list
    <li>
      <a href=\"$slide/index.html\">${slide#./}</a>
      (<a href=\"$slide/index.html?print-pdf\">export</a>)
      (<a href=\"$slide/index.html?embedded\">embedded</a>)
    </li>"
done

cat <<HTML
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>nownabe's slides</title>
  </head>
  <body>
    <ul>${list}</ul>
  </body>
</html>
HTML
