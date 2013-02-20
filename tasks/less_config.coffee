#
# grunt-less-config
# https://github.com/excellenteasy/grunt-less-config
#
# Copyright (c) 2013 Stephan Bönnemann
# Licensed under the MIT license.
#
"use strict"
module.exports = (grunt) ->

  grunt.registerMultiTask 'lessConfig', 'Pass variables to the less parser before compiling.', ->

    output = '//Source generated by grunt-less-config\n';

    for name, value of @options()
      output += "@#{name}: #{value};\n"

    output += '\n'

    do (output) =>
      for file in @files
        for path in file.src
          output += "@import \"#{path}\";\n"

        # Write the destination file.
        grunt.file.write file.dest, output

        # Print a success message.
        grunt.log.writeln "File \"" + file.dest + "\" created."