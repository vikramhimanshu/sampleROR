class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :name
      t.string :image_url
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
