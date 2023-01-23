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

desc 'Run CLI App on Moby Dick'
task :moby do |_|
  sh("ruby bin/index.rb ./spec/test_texts/moby-dick.txt")
end

desc 'Run CLI App on Brothers Karamazov'
task :brothers do |_|
  sh("ruby bin/index.rb ./spec/test_texts/brothers-karamazov.txt")
end

desc 'Run CLI App on Moby Dick and Brothers Karamazov'
task :both do |_|
  sh("ruby bin/index.rb ./spec/test_texts/moby-dick.txt ./spec/test_texts/brothers-karamazov.txt")
end
