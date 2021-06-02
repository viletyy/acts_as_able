module ActsAsAble
  # 发起评论的对象
  module Commenter
    def self.included(base)
      base.extend         ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      # Those call this method has the ability to be unlike by others
      def acts_as_commenter
        include ActsAsAble::AbleExt
        has_many :comments, as: :commenter, dependent: :destroy, class_name: 'Comment' 
      end
    end

    module InstanceMethods
      # 评论某对象
      def comment(content, obj, parent_comment = nil)
        if parent_comment.present? && parent_comment.is_a?(Comment)
          self.comments.create(content: content,commentable_type: class_name(obj), commentable_id: obj.id, parent_id: parent_comment.id )
        else
          self.comments.create(content: content, commentable_type: class_name(obj), commentable_id: obj.id,)
        end
      end

      # 是否评论了某对象 & 回复了某对象的评论
      def comment?(obj)
        !comment_by(obj).blank?
      end

      # 查看某种类型评论的所有对象
      def commentings(commentable_type)
        return commentable_type.constantize.where(id: self.comments.where(commentable_type: commentable_type).pluck(:commentable_id))
      end

      private

      def comment_by(obj)
        self.comments.find_by(commentable_type: class_name(obj), commentable_id: obj.id)
      end
    end
  end
end
