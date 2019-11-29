class CreateMastodonClients < ActiveRecord::Migration[6.0]
  def change
    create_table :mastodon_clients do |t|
      t.string :domain
      t.string :client_id
      t.string :client_secret

      t.timestamps
    end
  end
end