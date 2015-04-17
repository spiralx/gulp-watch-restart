
var gulp = require('gulp');

function doGitCheckout(callback) {
  console.log('doing checkout...');
  setTimeout(function() {
    console.log('done checkout...');
    callback();
  }, 1000);
}

var watcher;

gulp.task('watch:start', function() {
  if (!watcher) {
    watcher = gulp.watch('dist/**/*', ['build']);
    console.log('started watcher');
  }
});

gulp.task('watch:stop', function() {
  if (watcher) {
    watcher.end();
    watcher = null;
    console.log('stopped watcher');
  }
});


gulp.task('git:checkout', ['watch:stop'], function(cb) {
  console.log('isWatching = ' + !!watcher);

  // Start the Git checkout...
  doGitCheckout(function() {
    // The Git checkout is finished!
    gulp.start('watch:start', function() {
      cb();
    });
  });
});

gulp.task('default', ['watch:start', 'git:checkout']);
