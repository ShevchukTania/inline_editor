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
  spec.summary     = "Inline editor for Rails applications"
  spec.description = "Simple inline editor for Rails applications"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails"

  spec.add_development_dependency 'mini_racer'
  spec.add_development_dependency 'sqlite3', '~> 1.3', '>= 1.3.6'
end
