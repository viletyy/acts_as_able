# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require 'acts_as_able/version'

Gem::Specification.new do |spec|
  spec.name          = "acts_as_able"
  spec.version       = ActsAsAble::VERSION
  spec.authors       = ["Viletyy"]
  spec.email         = ["yystopf@gmail.com"]

  spec.summary       = %q{ActsAsAble Just Save Time For You.}
  spec.description   = %q{ActsAsAble Just Save Time For You.}
  spec.homepage      = "https://github.com/viletyy"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rails", "~> 6.0"
end
