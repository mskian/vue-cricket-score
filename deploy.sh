#!/usr/bin/env sh
# abort on errors
set -e
# build
yarn run build
# navigate into the build output directory
cd dist
# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME
git init
git add -A
git commit -m '🤖 Deploy'
git branch gh-pages
git push -f git@github.com:mskian/vue-cricket-score.git master:gh-pages
cd -