module ActsAsAble
  # 被赞的对象
  module Likable
    def self.included(base)
      base.extend         ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      # Those call this method has the ability to be unlike by others
      def acts_as_likable
        include ActsAsAble::AbleExt
        has_many :likers, as: :likable, dependent: :destroy, class_name: 'Like'
      end
    end

    module InstanceMethods
      def like_count
        self.likers.count
      end

      def likers_by_type(liker_type, options = {})
        ids = Like.
          where('likable_id' => self.id,
                'likable_type' => class_name(self),
                'liker_type' => liker_type.name
        ).pluck('liker_id')
        return liker_type.where("id in (?)", ids)
      end
    end
  end
end
