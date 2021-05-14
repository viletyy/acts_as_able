module ActsAsAble
  # 不喜欢的对象
  module Unlikable
    def self.included(base)
      base.extend         ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      # Those call this method has the ability to be unlike by others
      def acts_as_unlikable
        include ActAsAble::AbleExt
        has_many :unlikers, as: :unlikable, dependent: :destroy, class_name: 'Unlike'
      end
    end

    module InstanceMethods
      def unlike_count
        self.unlikers.count
      end
    end
  end
end
