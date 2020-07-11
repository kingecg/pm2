# pm2
create docker for run pm2

add pm2 web

Usage:
- first mount a vloume at /apps
- put your app into apps and a file named ecosystem.config.js
- expose port 9000, this is pm2-web port
```javascript
module.exports = {
    apps : [{
      name:'pm2-web',
      script:'../pm2-web/pm2-web.js'
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

```

then you can monitor from web