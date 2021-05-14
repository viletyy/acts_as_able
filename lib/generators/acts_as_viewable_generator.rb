require 'generators/acts_as_able_generator'

class ActsAsViewableGenerator < ActsAsAbleGenerator
  def create_migration_file
    migration_template 'view_migration.rb', 'db/migrate/acts_as_viewable_migration.rb'
  end

  def create_model
    template "view.rb", File.join('app/models', "view.rb")
  end
end
