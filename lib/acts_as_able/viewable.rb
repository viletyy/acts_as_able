module ActsAsAble
  # 浏览的对象
  module Viewable
    def self.included(base)
      base.extend         ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      # Those call this method has the ability to be unlike by others 
      def acts_as_viewable
        include ActsAsAble::AbleExt
        has_many :viewers, as: :viewable, dependent: :destroy, class_name: 'View'
      end
    end

    module InstanceMethods
      def view_count
        self.viewers.count
      end
    end
  end
end
