# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "yarpler"
  spec.version       = '0.1.1'
  spec.authors       = ["Nino Müller", "Christoph Schnyder"]
  spec.email         = ["nino.mueller@gmail.com", "christoph.schnyder@gmail.com"]
  spec.summary       = %q{Short summary of your project}
  spec.description   = %q{Longer description of your project.}
  spec.homepage      = "http://planik.ch/"
  spec.license       = "MIT"

  #spec.files         = ['lib/yarpler.rb']
  #spec.executables   = ['yarpler']
  #spec.test_files    = ['tests/test_utils.rb']
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", ">= 1.5.2", "< 1.7.0"
end
