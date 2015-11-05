$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "aact/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "aact"
  s.version     = Aact::VERSION
  s.authors     = ["sheri.tibbs@duke.edu"]
  s.email       = ["sheri.tibbs@duke.edu"]
  s.homepage    = "http://gitlab.oit.duke.edu:tibbs001/aact.git"
  s.summary     = "Engine that pulls data from ct.gov and allows you to embed related data into institutional app"
  s.description = "Engine that pulls data from ct.gov and allows you to embed related data into institutional app"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency "sqlite3"
  s.test_files = Dir["spec/**/*"]
end
