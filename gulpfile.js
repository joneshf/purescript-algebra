var gulp       = require('gulp')
  , clean      = require('gulp-clean')
  , purescript = require('gulp-purescript')
  , run        = require('gulp-run')
  ;

paths = {
    src: [
        'src/**/*.purs'
    ],
    test: [
        'src/**/*.purs',
        'test/**/*.purs',
        'bower_components/purescript-*/src/**/*.purs'
    ]
}

gulp.task('purescript', function() {
    return gulp.src(paths.src)
      .pipe(purescript.pscMake({output: 'output'}))
      .pipe(gulp.dest('js/'));
});

gulp.task('docs', function() {
    return gulp.src(paths.src)
      .pipe(purescript.pscDocs())
      .pipe(gulp.dest('README.md'));
});

gulp.task('test-clean', function() {
    return gulp.src('test/output')
      .pipe(clean());
});

gulp.task('test-compile', ['test-clean'], function() {
    return gulp.src(paths.test)
      .pipe(purescript.psc({main: 'Test.Data.Algebra', output: 'test/test.js'}))
      .pipe(run('node'));
});

gulp.task('default', ['purescript', 'docs']);
gulp.task('test', ['test-clean', 'test-compile']);
