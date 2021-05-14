module ActsAsAble
  # 不喜欢
  module Viewer
    def self.included(base)
      base.extend         ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      # Those call this method has the ability to be unlike by others
      def acts_as_viewer
        include ActsAsAble::AbleExt
        has_many :views, as: :viewer, dependent: :destroy, class_name: 'View' # 有很多不喜欢的 Object
      end
    end

    module InstanceMethods
      # 不喜欢某对象
      def view(obj)
        self.views.find_or_create_by(viewable_type: class_name(obj), viewable_id: obj.id) if obj != self
      end

      # 是否不喜欢某对象
      def view?(obj)
        !unlike_by(obj).blank?
      end

      private

      def view_by(obj)
        self.views.find_by(viewable_type: class_name(obj), viewable_id: obj.id)
      end
    end
  end
end
