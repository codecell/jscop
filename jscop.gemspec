lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jscop/version'

Gem::Specification.new do |spec|
  spec.name = 'jscop'
  spec.version = Jscop::VERSION
  spec.authors = ['Ezaka Alfred']
  spec.email = ['ezakaphil@gmail.com']

  spec.summary = 'A linter for checking errors in javascript code'
  spec.homepage = 'https://github.com/codecell/jscop'
  spec.license = 'MIT'
  spec.files = Dir.chdir(File.expand_path(__dir__) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables << 'jscop'
  spec.require_paths = %w[lib spec]

  spec.add_runtime_dependency 'colorize', '~> 0.8'
  spec.add_runtime_dependency 'tty-font', '~> 0.5'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
