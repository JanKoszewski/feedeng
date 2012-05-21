task :console do
  $: << File.expand_path("../lib", __FILE__)
  require 'feedeng'

  ARGV.clear
  require 'irb'
  IRB.start
end
