#!/bin/bash

echo "Downloading template..."

git clone git@github.com:woshiluo/hdu-report-typst.git
mv hdu-report-typst/template ./
mv hdu-report-typst/example.typ ./
rm hdu-report-typst -rf

echo "Done!"
