require 'rails/generators'
require 'rails/generators/migration'

class ActsAsAbleGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def self.next_migration_number(dirname)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end
end
