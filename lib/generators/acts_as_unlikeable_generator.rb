require 'rails/generators'
require 'rails/generators/migration'

class ActsAsUnlikeableGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def create_migration_file
    migration_template 'unlike_migration.rb', 'db/migrate/acts_as_unlikable_migration.rb'
  end

  def create_model
    template "unlike.rb", File.join('app/models', "unlike.rb")
  end
end
