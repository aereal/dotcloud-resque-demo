# vim:set ft=ruby:

CWD = File.dirname(File.expand_path(__FILE__)) unless defined?(CWD)
dotcloud_env = JSON.parse(File.read(File.join(CWD, 'environment.json')))
ENV.update(dotcloud_env)
Resque.redis = ENV['DOTCLOUD_DB_REDIS_URL'] || 'localhost:6379'
