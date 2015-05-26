require 'chatterbot/dsl'
require 'pry'
require 'yaml'
require_relative 'add_suspense'

keys = YAML.load_file('application.yml')

consumer_key keys['CONSUMER_KEY']
consumer_secret keys['CONSUMER_SECRET']
token keys['ACCESS_TOKEN']
secret keys['ACCESS_TOKEN_SECRET']



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
