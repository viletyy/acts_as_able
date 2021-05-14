require 'generators/acts_as_able_generator'

class ActsAsUnlikableGenerator < ActsAsAbleGenerator
  def create_migration_file
    migration_template 'unlike_migration.rb', 'db/migrate/acts_as_unlikable_migration.rb'
  end

  def create_model
    template "unlike.rb", File.join('app/models', "unlike.rb")
  end
end
