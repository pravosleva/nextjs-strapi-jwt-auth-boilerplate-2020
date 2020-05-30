#!/bin/bash
rm -rf .git/ &&
rm -rf .gitignore &&
rm -rf README.md &&
git clone https://github.com/pravosleva/nextjs-redux-saga-boilerplate-2020.git.git frontend &&
yarn --cwd ./frontend &&
# git clone https://github.com/pravosleva/path-to-backend.git backend &&
# yarn --cwd ./backend &&
echo "\
=============================================\
     ⚡ HEY! You can create new backend:\
\
     yarn global add create-strapi-app\
     yarn create-strapi-app backend\
=============================================\
\
=============================================\
     DEVELOPMENT\
=============================================\
\
👉 CHECK THIS BEFORE START:\
  🔥 STEP 1: ./ecosystem.dev.config.js" &&
echo "module.exports = {
  apps : [{
    name: 'back-1337',
    cwd: __dirname + '/backend',
    script: 'yarn',
    args: 'develop',
    interpreter: 'none',
    env: {
      NODE_ENV: 'development',
      PORT: '1337',
      DATABASE_HOST: 'ds01x5x4.mlab.com',
      DATABASE_PORT: '7777',
      DATABASE_NAME: 'sample-2020',
      DATABASE_USERNAME: '<DATABASE_USERNAME>',
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: 'sample-2020'
    }
  }, {
    name: 'front-3000',
    cwd: __dirname + '/frontend',
    script: 'yarn',
    args: 'start',
    interpreter: 'none',
    env: {
      NODE_ENV: 'development',
      PORT: '3000',
      REACT_APP_API_ENDPOINT: 'http://localhost:1337'
    }
  }],
};
" > ecosystem.dev.config.js &&
echo "  🔥 STEP 2 (if you dont use pm2): ./frontend/.env.development" &&
echo "REACT_APP_API_ENDPOINT=\"http://localhost:1337\"
" > frontend/.env.dev &&
echo "\
🚀 $ pm2 start ecosystem.dev.config.js\
\
=============================================\
     PRODUCTION\
=============================================\
\
👉 CHECK THIS BEFORE START:\
  🔥 STEP 1: ./frontend/.env.production" &&
echo "REACT_APP_API_ENDPOINT=\"https://DOMAIN.ru/api\"
" > frontend/.env.prod &&
echo "  🔥 STEP 2: ./ecosystem.prod.config.js" &&
echo "module.exports = {
  apps : [{
    name: 'strapi-autoru-3110',
    cwd: __dirname + '/backend',
    script: 'yarn',
    args: 'start',
    interpreter: 'none',
    env: {
      NODE_ENV: 'production',
      PORT: '3110',
      DATABASE_HOST: 'ds01x5x4.mlab.com',
      DATABASE_PORT: '7777',
      DATABASE_NAME: 'autoservices-tst-db',
      DATABASE_USERNAME: '<DATABASE_USERNAME>',
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: 'autoservices-tst-db'
    }
  }, {
    name: 'front-3000',
    cwd: __dirname + '/frontend',
    script: 'yarn',
    args: 'start',
    interpreter: 'none',
    env: {
      NODE_ENV: 'development',
      PORT: '3000',
      REACT_APP_API_ENDPOINT: 'https://DOMAIN.ru/api'
    }
  }],
};
" > ecosystem.prod.config.js &&
echo "\
🚀 $ bash build-all.sh\
🚀 $ pm2 start ecosystem.prod.config.js\
\
=============================================" # && rm -rf fullstack-init.sh
