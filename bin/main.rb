#!/usr/bin/env ruby
require_relative '../lib/helpers/lint_ware'
require 'tty-font'
require 'colorize'

def show_title
  font = TTY::Font.new
  font_messge = font.write('Js Companion', letter_spacing: 1)
  puts font_messge
end

def print_linter_result(error_bin, path)
  puts "Working Tree Is Clean, No Errors Found in #{path}".green if !error_bin.empty?
  puts

  counter = 0
  number_of_errors = error_bin.length

  puts "#{number_of_errors} Type(s) of Error(s) Found!".yellow if number_of_errors.positive?
  while counter < number_of_errors
    puts "#{counter + 1}. #{error_bin[counter]} In The Path #{path}".red
    counter += 1
  end
end

def js_companion_init
  show_title

  errors = []

  return unless ARGV.length.positive?

  path = ARGV[0]

  js_file_pattern = /(\w|\W)+.js$/

  if js_file_pattern.match?(path)
    LintWare.init_files_linting(path, errors)
  else
    LintWare.init_dir_linting(path, errors)
  end
  print_linter_result(errors, path)
end

js_companion_init
