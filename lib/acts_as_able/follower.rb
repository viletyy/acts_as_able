module ActsAsAble
  # 关注
  module Follower
    module ClassMethods
      def acts_as_follower
        include ActsAsFollowable::FollowableExt
        has_many :follows, as: :follower, dependent: :destroy, class_name: 'Follow'
      end
    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end

    module InstanceMethods
      #   # 1:   关注某人
      #   # 2:   取消关注
      #   # 3:   是否关注
      #   # 4:   关注了某个 model 多少个 obj
      def follow(obj)
        self.follows.find_or_create_by(followable_id: obj.id, followable_type: class_name(obj)) if obj != self
      end

      def unfollow(obj)
        get_follow_by_obj(obj).destroy
      end

      def follow?(obj)
        !get_follow_by_obj(obj).blank?
      end

      def followings(followable_type)
        return followable_type.constantize.where(id: self.follows.where(followable_type: followable_type).pluck(:followable_id))
      end

      private
      def get_follow_by_obj(obj)
        self.follows.find_by(followable_id: obj.id, followable_type: class_name(obj))
      end

    end
  end
end
