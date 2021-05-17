class Comment < ApplicationRecord

  belongs_to :commentable, :polymorphic => true
  belongs_to :commenter,   :polymorphic => true

  belongs_to :parent_comment, optional: true, foreign_key: :parent_id, class_name: 'Comment', counter_cache: :children_comments_count
  has_many :children_comments, foreign_key: :parent_id, dependent: :destroy, class_name: 'Comment'


end
