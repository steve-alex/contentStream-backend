class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets, { id: false } do |t|
      t.string :id, null: false
      t.string :domain

      t.timestamps
    end

    execute %Q{ ALTER TABLE "tweets" ADD PRIMARY KEY ("id") }
  end
end
