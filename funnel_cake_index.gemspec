# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "funnel_cake_index/version"

Gem::Specification.new do |spec|
  spec.name          = "funnel_cake_index"
  spec.version       = FunnelCakeIndex::VERSION
  spec.authors       = ["Steven Ng"]
  spec.email         = ["steven.ng@temple.edu"]

  spec.summary       = "Traject configuration and scripts for funnel_cake combine harvest indexing"
  spec.description   = "indexes combine harvest."
  spec.homepage      = "https://github.com/tulibraries/funnel_cake_index"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/tulibraries/funnel_cake_index.git"
    # spec.metadata["changelog_uri"] = "https://rubygems.org/gems/funnel_cake_index"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "gli"
  spec.add_dependency "library_stdnums"
  spec.add_dependency "rsolr"
  spec.add_dependency "traject"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rubocop"

  spec.add_development_dependency "binding_of_caller"
end
