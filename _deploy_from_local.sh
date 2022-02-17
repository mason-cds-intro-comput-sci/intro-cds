#!/bin/sh

set -e

#[ -z "${GITHUB_PAT}" ] && exit 0
#[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

# Set git config information
git config --global user.name "Dominic White (Travis-CI)"
git config --global user.email "dwhite34@gmu.edu"

rm -Rf book-output
# Clone the gh-pages repository
git clone -b gh-pages \
    https://github.com/mason-cds-intro-comput-sci/intro-cds.git \
    book-output

# Change to the gh-page clone book-output directory
cd book-output

# Copy generated output to book-output
cp -r ../docs/* ./

# Add all files to the repo
git add *
git commit -a -m "Updating book "
git push -q origin gh-pages
