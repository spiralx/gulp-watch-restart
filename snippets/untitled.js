
var gulp = require('gulp');

var watcher = null;

gulp.task('gitwatch:start', function() {
  watcher = gulp.watch('.git/**/*.lock', []);
  watcher.on('change', function(event) {
    if (event.type === 'added') {
      console.warn('Lock detected!')
    }
  });

