require 'generators/acts_as_able_generator'

class ActsAsLikableGenerator < ActsAsAbleGenerator
  def create_migration_file
    migration_template 'like_migration.rb', 'db/migrate/acts_as_likable_migration.rb'
  end

  def create_model
    template "like.rb", File.join('app/models', "like.rb")
  end
end
