require "acts_as_able/version"

module ActsAsViewable
  extend ActiveSupport::Autoload
  autoload :AbleExt,        'acts_as_able/able_ext'
  autoload :Viewable,      'acts_as_able/viewable'
  autoload :Viewer,        'acts_as_able/viewer'

  # require 'acts_as_followable/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
  ActiveSupport.on_load(:active_record) do
    include ActsAsAble::Viewable
    include ActsAsAble::Viewer
  end

end
