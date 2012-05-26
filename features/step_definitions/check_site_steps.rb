require 'httparty'
require 'capybara'
require 'capybara/dsl'
include Capybara::DSL


Given /^cucumber\-chef url "(.*?)" open it$/ do |check_url|
  @response = HTTParty.get(check_url)
  @response.code.should eq 200
  $check_url = check_url or 'http://cucumber-chef.org/'
end

When 'it has "$check_title" in title' do |check_title|
  @response.body.downcase.include?('<title>'+check_title.downcase).should eq true
end

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = $check_url

When /^i can click on big "(.*?)" button$/ do |big_blue|
  visit($check_url)
  find(:xpath, "//a/img[@alt='#{big_blue}']/..").click.should eq 'ok'
end

When /^i can click on small "(.*?)"$/ do |buy_button|
  visit($check_url)
  find(:xpath, "//a/img[@alt='#{buy_button}']/..").click.should eq 'ok'
end

Then /^task finished$/ do
  puts 'Great!'
end
