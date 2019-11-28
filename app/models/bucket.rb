class Bucket < ApplicationRecord
  belongs_to :user
  has_many :tweet_buckets
  has_many :tweets, through: :tweet_buckets
end
