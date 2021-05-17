module ActsAsAble
  # 发起踩的对象
  module Disser
    def self.included(base)
      base.extend         ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      # Those call this method has the ability to be unlike by others
      def acts_as_disser
        include ActsAsAble::AbleExt
        has_many :disses, as: :disser, dependent: :destroy, class_name: 'Diss' # 有很多不喜欢的 Object
      end
    end

    module InstanceMethods
      # 踩某对象
      def diss(obj)
        self.disses.find_or_create_by(dissable_type: class_name(obj), dissable_id: obj.id)
      end

      # 取消对某对象对踩
      def undiss(obj)
        diss_by(obj).destroy
      end

      # 是否踩了某对象
      def diss?(obj)
        !diss_by(obj).blank?
      end

      # 查看某种类型踩的所有对象
      def dissings(dissable_type)
        return dissable_type.constantize.where(id: self.disses.where(dissable_type: dissable_type).pluck(:dissable_id))
      end

      private

      def diss_by(obj)
        self.disses.find_by(dissable_type: class_name(obj), dissable_id: obj.id)
      end
    end
  end
end
