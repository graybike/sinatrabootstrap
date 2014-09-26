module.exports = function(grunt) {

    // 1. All configuration goes here 
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        concat: {   
            dist: {
                src: [
                    'js/libs/*.js', // All JS in the libs folder
                    'js/*.js'  // This specific file
                ],
                dest: 'public/js/app.js',
            }
        },
        uglify: {
            build: {
                src: 'public/js/app.js',
                dest: 'public/js/app.min.js'
            }
        },
        watch: {
            scripts: {
                files: ['js/*.js'],
                tasks: ['concat', 'uglify'],
                options: {
                    spawn: false,
                },
            },
            css: {
                files: ['stylesheets/*.scss'],
                tasks: ['sass'],
                options: {
                    spawn: false,
                }
            }
        },
        sass: {
            dist: {
                options: {
                    loadPath: require('node-bourbon').includePaths,
                    style: 'compressed'
                },
                files: {
                    'public/stylesheets/application.css': 'stylesheets/application.scss'
                }
            } 
        }
    });

    // 3. Where we tell Grunt we plan to use this plug-in.
    grunt.loadNpmTasks('grunt-contrib-concat');  // Concatenate JS
    grunt.loadNpmTasks('grunt-contrib-uglify');  // Uglify that JS
    grunt.loadNpmTasks('grunt-contrib-watch');   // Watch those files and update accordingly
    grunt.loadNpmTasks('grunt-contrib-sass');    // Preprocess that CSS

    // 4. Where we tell Grunt what to do when we type "grunt" into the terminal.
    grunt.registerTask('default', ['concat', 'uglify', 'sass']);

};