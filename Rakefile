# frozen_string_literal: true

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task default: :spec

desc 'Restart web server'
task :test do
  'rspec spec/index_test.rb'
end
