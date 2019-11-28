class Tweet < ApplicationRecord
  has_many :tweet_buckets
  has_many :buckets, through: :tweet_bucket
  validates :id, uniqueness: true
end
