# frozen_string_literal: true

require_relative "lib/passweird/version"

Gem::Specification.new do |spec|
  spec.name = "passweird"
  spec.version = Passweird::VERSION
  spec.authors = ["Rupert Señga"]
  spec.email = ["pertsenga@gmail.com"]

  spec.summary = "A library to assess password security and give the ability to check it against an arbitrary blacklist"
  spec.homepage = "https://github.com/pertsenga/passweird"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/pertsenga/passweird"
  spec.metadata["changelog_uri"] = "https://github.com/pertsenga/passweird/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 7.0", "< 8.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
