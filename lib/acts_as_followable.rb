require "acts_as_able/version"

module ActsAsFollowable
  extend ActiveSupport::Autoload
  autoload :AbleExt,        'acts_as_able/able_ext'
  autoload :Followable,     'acts_as_able/followable'
  autoload :Follower,       'acts_as_able/follower'

  # require 'acts_as_followable/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
  ActiveSupport.on_load(:active_record) do
    include ActsAsAble::Followable
    include ActsAsAble::Follower
  end

end
