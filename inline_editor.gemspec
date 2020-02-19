$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "inline_editor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "inline_editor"
  spec.version     = InlineEditor::VERSION
  spec.authors     = ["ShevchukTania"]
  spec.email       = ["taniabeley@ukr.net"]
  spec.homepage    = "https://github.com/ShevchukTania/inline_editor"
  spec.summary     = "Summary of InlineEditor."
  spec.description = "Description of InlineEditor."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails"

  spec.add_development_dependency 'mini_racer'
  spec.add_development_dependency 'sqlite3', '~> 1.3', '>= 1.3.6'
end
