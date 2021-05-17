require 'generators/acts_as_able_generator'

class ActsAsDissableGenerator < ActsAsAbleGenerator
  def create_migration_file
    migration_template 'diss_migration.rb', 'db/migrate/acts_as_dissable_migration.rb'
  end

  def create_model
    template "diss.rb", File.join('app/models', "diss.rb")
  end
end
