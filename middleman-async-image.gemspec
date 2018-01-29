# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-async-image"
  s.version     = "0.0.3"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bastien Robert"]
  s.email       = ["bastienrobert@outlook.com"]
  s.homepage    = "https://github.com/bastienrobert/middleman-async-image"
  s.summary     = "Load your images asynchronously"
  s.description = "Finally a gem to load automaticly your images asynchronously, like Medium."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 4.2.1"])
  s.add_dependency("rmagick", [">= 2.0.0"])

  # Additional dependencies
  # s.add_runtime_dependency("gem-name", "gem-version")
end
