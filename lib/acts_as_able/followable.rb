module ActsAsAble
  module Followable #这个是被关注

    def self.included(base)
      base.extend         ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      def acts_as_followable #This means can be followed - 被关注
        include ActsAsAble::AbleExt

        has_many :followers, as: :followable, dependent: :destroy, class_name: 'Follow'
      end
    end

    module InstanceMethods
      # 1: 查看某个 模型 关注我的所有对象
      # 2: 查看某个 模型 的某个 实例 是否关注我了
      def followers_count
        self.followers.count
      end

      def followers_by_type(follower_type, options = {})
        ids = Follow.
          where('followable_id' => self.id,
                'followable_type' => class_name(self),
                'follower_type' => follower_type.name
        ).pluck('follower_id')
        return follower_type.where("id in (?)", ids)
      end
    end
  end
end
