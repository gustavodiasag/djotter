# frozen_string_literal: true

require "bundler/gem_tasks"
require "rb_sys/extensiontask"

task build: :compile

GEMSPEC = Gem::Specification.load("djotter.gemspec")

RbSys::ExtensionTask.new("djotter", GEMSPEC) do |ext|
  ext.lib_dir = "lib/djotter"
end

task default: :compile
