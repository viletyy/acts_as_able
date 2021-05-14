require 'generators/acts_as_able_generator'

class ActsAsFollowableGenerator < ActsAsAbleGenerator
  def create_migration_file
    migration_template 'follow_migration.rb', 'db/migrate/acts_as_followable_migration.rb'
  end

  def create_model
    template "follow.rb", File.join('app/models', "follow.rb")
  end
end
