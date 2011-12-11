#!/usr/bin/env ruby

$: << File.dirname(File.expand_path(__FILE__))
require 'logger'
require 'resque/server'
require 'app'

use Rack::ShowExceptions

# Set the AUTH env variable to your basic auth password to protect Resque.
if ENV['RESQUE_ADMIN_USERNAME'] && ENV['RESQUE_ADMIN_PASSWORD']
  Resque::Server.use Rack::Auth::Basic do |username, password|
    username == ENV['RESQUE_ADMIN_USERNAME']
    password == ENV['RESQUE_ADMIN_PASSWORD']
  end
end

run Rack::URLMap.new \
  "/"       => Demo::App.new,
  "/resque" => Resque::Server.new
