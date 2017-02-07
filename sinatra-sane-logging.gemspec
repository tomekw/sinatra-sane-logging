lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = "sinatra-sane-logging"
  spec.version = "0.1.0"
  spec.authors = ["Tomek Wałkuski"]
  spec.email = "ja@jestem.tw"

  spec.summary = "Sinatra logging for human beings"
  spec.homepage = "https://github.com/tomekw/sinatra-sane-logging"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = %w[lib]

  spec.add_dependency "sinatra", ">= 0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "rack-test", ">= 0"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "rubocop", "~> 0"
  spec.add_development_dependency "simplecov", "~> 0"
end
