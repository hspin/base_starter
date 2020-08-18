const gulp = require('gulp');
const postcss = require('gulp-postcss');
const sourcemaps = require('gulp-sourcemaps');
const csso = require('gulp-csso');
const del = require('del');
const purgecss = require('gulp-purgecss');

gulp.task('clean', function() {
  return del(['build/**/*']);
});

gulp.task('clean:final', function() {
  return del(['final/**/*']);
});

gulp.task('css:dev', () => {
  return gulp
    .src('src/**/*.css')
    .pipe(postcss([require('tailwindcss'), require('autoprefixer')]))
    .pipe(gulp.dest('build/'));
});

gulp.task('css:prod', () => {
  return gulp
    .src('src/**/*.css')
    .pipe(sourcemaps.init())
    .pipe(postcss([require('tailwindcss'), require('autoprefixer')]))
    .pipe(csso())
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest('build/'));
});

gulp.task('purgecss', () => {
  return gulp
    .src('dist/**/*.css')
    .pipe(
      purgecss({
        content: ['./dist/**/*.html', './dist/**/*.js'],
        defaultExtractor: content =>
        content.match(/[A-Za-z0-9-_:/]+/g) || []
      }),
    )
    .pipe(csso())
    .pipe(gulp.dest('final'));
});

gulp.task('prod', gulp.series('clean', 'css:prod'));

gulp.task('purge', gulp.series('clean:final', 'purgecss'));

gulp.task('default', gulp.series('clean', 'css:dev'));
