# frozen_string_literal: true

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'Run All Tests'
task :test do
  sh('rspec spec/index_test.rb')
end

desc 'Run CLI App'
task :run do |_, _args|
  arg_string = ARGV.drop(1).join(' ')
  sh("ruby bin/index.rb #{arg_string}")
end
