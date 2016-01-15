require 'rubocop/rake_task'

RuboCop::RakeTask.new

require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber_dry) do |t|
  t.cucumber_opts = '-d'
end

task default: [:rubocop, :cucumber_dry]
