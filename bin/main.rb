#!/usr/bin/env ruby
require_relative '../lib/helpers/lint_ware'

errors = []

if ARGV.length.positive?
  path = ARGV[0]

  regex = /(\w|\W)+.js$/

  if regex.match?(path)
    LintWare.init_files_linting(path, errors)
  else
    LintWare.init_dir_linting(path, errors)
  end
end
