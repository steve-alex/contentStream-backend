class TweetBucket < ApplicationRecord
  belongs_to :tweet
  belongs_to :bucket
end
