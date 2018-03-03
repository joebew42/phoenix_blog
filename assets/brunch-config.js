exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: {
        "js/app.js": /^(vendor)|(vendor\/semantic\/dist)|(js)/
      }
    },
    stylesheets: {
      joinTo: {
        "css/app.css": /^(vendor\/semantic\/dist)|(css)/
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    assets: [
      /^(static)/
    ],
    ignored: [
      /^(js\/socket\.js)/,
      /^(vendor\/semantic\/gulpfile\.js)/,
      /^(vendor\/semantic\/tasks)/,
      /^(vendor\/semantic\/src)/
    ]
  },

  hooks: {
    onCompile(generatedFiles, changedAssets) {
      var copy = require('copy');
      copy('vendor/semantic/dist/themes/**/*.*', '../priv/static/css/themes', function(err, files) {
        if (err) throw err;
      });
    }
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: ["static", "css", "js", "vendor"],
    // Where to compile files to
    public: "../priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/vendor/]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["js/app"]
    }
  },

  npm: {
    enabled: true
  }
};
