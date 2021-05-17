module ActsAsAble
  # 发起浏览的对象
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
      # 浏览某对象
      def view(obj)
        self.views.create(viewable_type: class_name(obj), viewable_id: obj.id) 
      end

      # 是否浏览某对象
      def view?(obj)
        !view_by(obj).blank?
      end

      # 查看某种类型浏览的所有对象
      def viewings(viewable_type)
        return viewable_type.constantize.where(id: self.views.where(viewable_type: viewable_type).pluck(:viewable_id))
      end

      private

      def view_by(obj)
        self.views.find_by(viewable_type: class_name(obj), viewable_id: obj.id)
      end
    end
  end
end
