module ActsAsAble
  # 被踩的对象
  module Dissable
    def self.included(base)
      base.extend         ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      # Those call this method has the ability to be unlike by others
      def acts_as_disable
        include ActsAsAble::AbleExt
        has_many :dissers, as: :dissable, dependent: :destroy, class_name: 'Diss'
      end
    end

    module InstanceMethods
      def diss_count
        self.dissers.count
      end

      def dissers_by_type(disser_type, options = {})
        ids = Diss.
          where('dissable_id' => self.id,
                'dissable_type' => class_name(self),
                'disser_type' => disser_type.name
        ).pluck('disser_id')
        return disser_type.where("id in (?)", ids)
      end
    end
  end
end
