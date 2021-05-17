class ActsAsLikableMigration < ActiveRecord::Migration[5.0]
  def self.up
    create_table :likes, force: true do |t|
      t.references :likable, polymorphic: true, null: false
      t.references :liker, polymorphic: true, null: false
      t.timestamps
    end
  end

  def self.down
    drop_table :likes
  end
end
