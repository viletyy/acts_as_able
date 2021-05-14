class ActsAsViewableMigration < ActiveRecord::Migration[5.0]
  def self.up
    create_table :views, force: true do |t|
      t.references :viewable, polymorphic: true, null: false
      t.references :viewer, polymorphic: true, null: false
      t.timestamps
    end
  end

  def self.down
    drop_table :views
  end
end
