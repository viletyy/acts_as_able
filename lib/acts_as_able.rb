require "acts_as_able/version"

module ActsAsAble
  extend ActiveSupport::Autoload
  autoload :AbleExt,        'acts_as_able/able_ext'
  autoload :Followable,     'acts_as_able/followable'
  autoload :Follower,       'acts_as_able/follower'
  autoload :Unlikable,      'acts_as_able/unlikable'
  autoload :Unliker,        'acts_as_able/unliker'
  autoload :Viewable,       'acts_as_able/viewable'
  autoload :Viewer,         'acts_as_able/viewer'

  # require 'acts_as_followable/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
  ActiveSupport.on_load(:active_record) do
    include ActsAsAble::Followable
    include ActsAsAble::Follower
    include ActsAsAble::Unlikable
    include ActsAsAble::Unliker
    include ActsAsAble::Viewable
    include ActsAsAble::Viewer
  end

end