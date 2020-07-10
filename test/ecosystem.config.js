module.exports = {
    apps : [{
      name:'pm2-web',
      script:'pm2-web'
    },{
      name: "app",
      script: "./index.js",
      env: {
        NODE_ENV: "development",
      },
      env_production: {
        NODE_ENV: "production",
      }
    }]
  }