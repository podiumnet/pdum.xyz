module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
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

  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.registerTask 'default', ['coffee']
