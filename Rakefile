require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task deploy: [:build] do
  sh 'gem push pkg/*.gem'
  sh 'rm -rf pkg/'
end
