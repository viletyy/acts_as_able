class ActsAsCommentableMigration < ActiveRecord::Migration[5.0]
  def self.up
    create_table :comments, force: true do |t|
      t.references :commentable, polymorphic: true, null: false
      t.references :commenter, polymorphic: true, null: false
      t.integer :parent_id
      t.integer :children_comments_count, default: 0
      t.text :content
      t.timestamps
    end
    add_index :comments, :parent_id
  end

  def self.down
    drop_table :comments
  end
end
