require "bundler/gem_tasks"

task :test do
  Dir['./test/**/*'].each do |file|
    system("ruby #{file}")
  end
end