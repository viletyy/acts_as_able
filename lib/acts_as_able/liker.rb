module ActsAsAble
  # 发起赞的对象
  module Liker
    def self.included(base)
      base.extend         ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      # Those call this method has the ability to be unlike by others
      def acts_as_liker
        include ActsAsAble::AbleExt
        has_many :likes, as: :liker, dependent: :destroy, class_name: 'Like' # 有很多不喜欢的 Object
      end
    end

    module InstanceMethods
      # 赞某对象
      def like(obj)
        self.likes.find_or_create_by(likable_type: class_name(obj), likable_id: obj.id)
      end

      # 取消对某对象的赞
      def unlike(obj)
        like_by(obj).destroy
      end

      # 是否赞了某对象
      def like?(obj)
        !like_by(obj).blank?
      end

      # 查看某种类型踩的所有对象
      def likings(likable_type)
        return likable_type.constantize.where(id: self.likes.where(likable_type: likable_type).pluck(:likable_id))
      end

      private

      def like_by(obj)
        self.likes.find_by(likable_type: class_name(obj), likable_id: obj.id)
      end
    end
  end
end
