#!/usr/bin/env ruby
require_relative '../lib/helpers/lint_ware'
require_relative '../lib/error'
require 'tty-font'
require 'colorize'

def show_title
  font = TTY::Font.new
  font_messge = font.write('Js Companion', letter_spacing: 1)
  puts font_messge
end

def js_companion_init
  show_title

  errors = []

  return unless ARGV.length.positive?

  path = ARGV[0]

  js_file_pattern = /(\w|\W)+.js$/

  if js_file_pattern.match?(path)
    LintWare.init_files_linting(path)
  else
    LintWare.init_dir_linting(path)
  end
end

js_companion_init
