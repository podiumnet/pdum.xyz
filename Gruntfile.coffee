module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffeelint:
      app: ["src/**/*.coffee"]
    coffee:
      default:
        options:
          sourceMap: true
          sourceMapDir: 'maps'
        expand: true
        cwd: 'src'
        src: ['*.coffee', '**/*.coffee']
        dest: 'compiled'
        ext: '.js'
    sass:
      default:
        options:
          style: 'compressed'
        files: [
            expand: true
            cwd: 'styles'
            src: ['*.sass']
            dest: 'css'
            ext: '.css'
        ]

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-coffeelint'

  grunt.registerTask 'default', ['coffee', 'sass', 'coffeelint']
