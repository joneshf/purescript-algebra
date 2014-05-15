var gulp = require('gulp');
var gulpc = require('gulp-clean');
var purescript = require('gulp-purescript');

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

// TODO: there's no docgen in gulp-purescript!!
gulp.task('docs', function() {
    return gulp.src(paths.src)
      .pipe(purescript.docgen())
      .pipe(gulp.dest('README.md'));
});

gulp.task('test-clean', function() {
    return gulp.src('test/output')
      .pipe(gulpc());
});

gulp.task('test-compile', ['test-clean'], function() {
    return gulp.src(paths.test)
      .pipe(purescript.pscMake({output: 'test/output'}));
});

gulp.task('default',['purescript']);
gulp.task('test',['test-clean', 'test-compile']);
