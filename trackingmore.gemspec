
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "trackingmore"

Gem::Specification.new do |spec|
  spec.name          = "trackingmore"
  spec.version       = TrackingMore::VERSION
  spec.authors       = ["trackingmore"]
  spec.email         = ["manage@trackingmore.org"]

  spec.summary       = "The Ruby SDK of Trackingmore API"
  spec.description   = "Developed for easy integration with TrackingMore"
  spec.homepage      = "https://www.trackingmore.com/"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rspec", "~> 3.12"
end
