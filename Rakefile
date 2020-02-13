# frozen_string_literal: true

task :environment do
  ENV['SLACK_API_TOKEN'] = File.read('config/.slackbot').chomp
  ENV['X-RapidAPI-Key'] = File.read('config/.news').chomp
end
namespace :deploy do
  desc 'start mybot'
  task run: :environment do
    require_relative 'bin/run'
  end
end
