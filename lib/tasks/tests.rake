require 'rake/testtask'

desc 'run minitest suite'
task :test do
  $:.unshift(*%w(test spec).collect{ |dir| File.expand_path(File.join(File.dirname(__FILE__), '../..', dir)) })
  Dir.glob('./test/**/test_*.rb'){ |file| require file }
end