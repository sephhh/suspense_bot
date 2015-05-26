class AddSuspense

  def initialize(tweet_text)
    @original_tweet = tweet_text
    
  end

  def suspenseful_tweet
    tweet_length = @original_tweet.length
    if tweet_length >= 130
      #TODO make this more elegant
      @original_tweet = @original_tweet[0..129]
      tweet_length = @original_tweet.length
    end
    split_tweet = @original_tweet.split(" ")
    newline_length = 135-tweet_length
    insertion = "..." + "\n." * (newline_length/2) + ".."
    last_word = split_tweet.pop
    split_tweet.join(" ") + insertion + last_word
    #returns a more suspensful version of the tweet
  end
end

# first_test = AddSuspense.new("This is one test tweet")
# puts first_test.suspenseful_tweet

# second_test = AddSuspense.new("This tweet could use some suspense")
# puts second_test.suspenseful_tweet

# longer_test = AddSuspense.new("Here is a bit longer of a tweet let's see if this still works pretty well and throw in some characters /asfq215v6 and done")
# puts longer_test.suspenseful_tweet


# real_tweet_test = AddSuspense.new("@suspense_bot here is a tweet for you to mess around with")
# puts real_tweet_test.suspenseful_tweet


##TODO
##deal with length better


