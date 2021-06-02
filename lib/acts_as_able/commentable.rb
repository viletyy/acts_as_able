module ActsAsAble
  # 被评论的对象
  module Commentable
    def self.included(base)
      base.extend         ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      # Those call this method has the ability to be unlike by others
      def acts_as_commentable
        include ActsAsAble::AbleExt
        has_many :commenters, as: :commentable, dependent: :destroy, class_name: 'Comment'
      end
    end

    module InstanceMethods
      def root_commenters 
        self.commenters.where(parent_id: nil)
      end

      def root_commenters_by_type(commenter_type, options= {})
        ids = Comment.
          where('commentable_id' => self.id,
                'commentable_type' => class_name(self),
                'commenter_type' => commenter_type.name,
                'parent_id' => nil
        ).pluck('commenter_id')
        return commenter_type.where("id in (?)", ids)
      end
      
      def comment_count
        self.commenters.count
      end

      def commenters_by_type(commenter_type, options = {})
        ids = Comment.
          where('commentable_id' => self.id,
                'commentable_type' => class_name(self),
                'commenter_type' => commenter_type.name
        ).pluck('commenter_id')
        return commenter_type.where("id in (?)", ids)
      end
    end
  end
end
