class ActsAsDissableMigration < ActiveRecord::Migration[5.0]
  def self.up
    create_table :disses, force: true do |t|
      t.references :dissable, polymorphic: true, null: false
      t.references :disser, polymorphic: true, null: false
      t.timestamps
    end
  end

  def self.down
    drop_table :disses
  end
end
