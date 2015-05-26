require 'chatterbot/dsl'
require 'pry'
require 'dotenv'
require_relative 'add_suspense'
Dotenv.load


consumer_key ENV['CONSUMER_KEY']
consumer_secret ENV['CONSUMER_SECRET']
token ENV['ACCESS_TOKEN']
secret ENV['ACCESS_TOKEN_SECRET']


loop do
  # puts "in the loop"
  replies do |tweet|
    src = tweet.text.gsub(/@suspense_bot/, "@#{tweet.user.handle}")
    reply "#{AddSuspense.new(src).suspenseful_tweet}", tweet
    # reply "#USER# Thanks for contacting me!", tweet
  end

  # explicitly update our config
  puts "updating config"
  update_config

  puts "sleeping"
  sleep 60
end
