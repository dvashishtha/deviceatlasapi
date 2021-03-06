# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deviceatlasapi/version'

Gem::Specification.new do |spec|
  spec.name          = "deviceatlasapi"
  spec.version       = DeviceAtlasApi::VERSION
  spec.authors       = ["Trevor Kimenye"]
  spec.email         = ["kimenye@gmail.com"]
  spec.description   = %q{Lets you access the DeviceAtlas cloud api}
  spec.summary       = %q{Ruby gem to access DeviceAtlas cloud api}
  spec.homepage      = "https://github.com/kimenye/deviceatlasapi"
  spec.license       = "MIT"

  spec.files = Dir["{lib,vendor}/**/*"] + ["LICENSE.txt", "README.md", "README.ClientSide.txt"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "httparty"
  spec.add_dependency "railties", "~> 3.1"
end
