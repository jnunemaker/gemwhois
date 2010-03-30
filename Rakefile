require 'rubygems'
require 'rake'
require 'jeweler'
require File.dirname(__FILE__) + '/lib/gemwhois/version'

Jeweler::Tasks.new do |gem|
  gem.name        = 'gemwhois'
  gem.summary     = 'whois for gems'
  gem.description = 'whois for gems'
  gem.email       = 'nunemaker@gmail.com'
  gem.homepage    = 'http://github.com/jnunemaker/gemwhois'
  gem.authors     = ["John Nunemaker"]
  gem.version     = Gemwhois::Version
  gem.files       = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*', 'test/**/*'].to_a

  gem.add_dependency 'crack'
  gem.add_dependency 'unindent'

  gem.add_development_dependency 'shoulda'
  gem.add_development_dependency 'jeweler'
  gem.add_development_dependency 'fakeweb'
  gem.add_development_dependency 'mocha'
end
Jeweler::GemcutterTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs      << 'lib' << 'test'
  test.ruby_opts << '-rubygems'
  test.pattern   = 'test/**/test_*.rb'
  test.verbose   = true
end

task :test => :check_dependencies
task :default => :test