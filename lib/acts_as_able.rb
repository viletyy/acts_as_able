require "acts_as_able/version"

module ActsAsAble
  extend ActiveSupport::Autoload
  autoload :AbleExt,        'acts_as_able/able_ext'
  autoload :Commentable,    'acts_as_able/commentable'
  autoload :Commenter,      'acts_as_able/commenter'
  autoload :Dissable,       'acts_as_able/dissable'
  autoload :Disser,         'acts_as_able/disser'
  autoload :Followable,     'acts_as_able/followable'
  autoload :Follower,       'acts_as_able/follower'
  autoload :Likable,        'acts_as_able/likable'
  autoload :Liker,          'acts_as_able/liker'
  autoload :Viewable,       'acts_as_able/viewable'
  autoload :Viewer,         'acts_as_able/viewer'

  # require 'acts_as_followable/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
  ActiveSupport.on_load(:active_record) do
    include ActsAsAble::Commentable 
    include ActsAsAble::Commenter
    include ActsAsAble::Dissable
    include ActsAsAble::Disser
    include ActsAsAble::Followable
    include ActsAsAble::Follower
    include ActsAsAble::Likable 
    include ActsAsAble::Liker
    include ActsAsAble::Viewable
    include ActsAsAble::Viewer
  end

end