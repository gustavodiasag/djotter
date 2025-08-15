# frozen_string_literal: true

require "bundler/gem_tasks"
require "rb_sys/extensiontask"

GEMSPEC = Gem::Specification.load("djotter.gemspec")

RbSys::ExtensionTask.new("djotter", GEMSPEC) do |ext|
  ext.lib_dir = "lib/djotter"
end

# Tasks

task default: [:compile]

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  desc "Test gem using RSpec"
  task :test => :spec
rescue LoadError
  # no rspec available
end

desc "Open console with extension loaded"
task :console => :compile do
  exec "irb -r ./lib/djotter.rb"
end
