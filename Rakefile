require "bundler/gem_tasks"

task :test do
  Dir['./test/**/*_test.rb'].each do |file|
    system("ruby #{file}")
  end
end