require "acts_as_able/version"

module ActsAsFollowable
  extend ActiveSupport::Autoload
  autoload :AbleExt,        'acts_as_able/able_ext'
  autoload :Unlikable,      'acts_as_able/unlikable'
  autoload :Unliker,        'acts_as_able/unliker'

  # require 'acts_as_followable/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
  ActiveSupport.on_load(:active_record) do
    include ActsAsAble::Unlikable
    include ActsAsAble::Unliker
  end

end
