# -*- encoding: utf-8 -*-
# stub: tty-font 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "tty-font".freeze
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "bug_tracker_uri" => "https://github.com/piotrmurach/tty-font/issues", "changelog_uri" => "https://github.com/piotrmurach/tty-font/blob/master/CHANGELOG.md", "documentation_uri" => "https://www.rubydoc.info/gems/tty-font", "homepage_uri" => "https://piotrmurach.github.io/tty", "source_code_uri" => "https://github.com/piotrmurach/tty-font" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Piotr Murach".freeze]
  s.date = "2020-01-16"
  s.description = "Write text in large stylized characters using a variety of terminal friendly fonts.".freeze
  s.email = ["piotr@piotrmurach.com".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "fonts/3d.md".freeze, "fonts/block.md".freeze, "fonts/doom.md".freeze, "fonts/standard.md".freeze, "fonts/starwars.md".freeze, "fonts/straight.md".freeze]
  s.files = ["README.md".freeze, "fonts/3d.md".freeze, "fonts/block.md".freeze, "fonts/doom.md".freeze, "fonts/standard.md".freeze, "fonts/starwars.md".freeze, "fonts/straight.md".freeze]
  s.homepage = "https://piotrmurach.github.io/tty".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Terminal fonts".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.5"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, [">= 1.5"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, [">= 1.5"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
