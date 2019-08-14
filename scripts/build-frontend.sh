#!/bin/bash

cd /profile_ver2/frontend
npm install
npm run build

cp -a /profile_ver2/frontend/dist/static/js/. /profile_ver2/app/assets/javascripts/frontend
cp -a /profile_ver2/frontend/dist/static/css/. /profile_ver2/app/assets/stylesheets/frontend

if [ -d /profile_ver2/frontend/dist/static/img/ ] ;then
  # ディレクトリないとcpでエラーになるからなければ作る
  if [ ! -d /profile_ver2/public/static/img ] ;then
    mkdir -p /profile_ver2/public/static/img
  fi
  cp -a /profile_ver2/frontend/dist/static/img/. /profile_ver2/public/static/img/
fi