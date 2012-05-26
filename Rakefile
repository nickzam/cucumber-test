#!/usr/bin/env rake
before_script:
  - "export DISPLAY=:99.0"
  - "sh -e /etc/init.d/xvfb start"

task :cucumber do
  ["rspec spec", "rake cucumber"].each do |cmd|
    puts "Starting to run #{cmd}..."
    system("export DISPLAY=:99.0 && bundle exec #{cmd}")
    raise "#{cmd} failed!" unless $?.exitstatus == 0
  end

end