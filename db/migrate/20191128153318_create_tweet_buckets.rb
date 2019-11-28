class CreateTweetBuckets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_buckets do |t|
      t.integer :tweet_id
      t.references :bucket, null: false, foreign_key: true

      t.timestamps
    end

    add_index(:tweet_buckets, :tweet_id, unique: true)
  end
end
