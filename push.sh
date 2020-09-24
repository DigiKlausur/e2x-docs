#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  cd build
  rsync -a html/ ../../digiklausur.github.io
  cd ../../digiklausur.github.io
  git checkout -b develop
  git fetch --all
  git reset --hard origin/develop
  git add .
  git commit -m "New release pushed"


}

upload_files() {
  git remote add origin-pages https://${GITHUBH_TOKEN}@github.com/DigiKlausur/digiklausur.github.io > /develop 2>&1
  git push --quiet --set-upstream origin-pages develop
}

setup_git
commit_website_files
upload_files