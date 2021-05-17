require 'generators/acts_as_able_generator'

class ActsAsCommentableGenerator < ActsAsAbleGenerator
  def create_migration_file
    migration_template 'comment_migration.rb', 'db/migrate/acts_as_commentable_migration.rb'
  end

  def create_model
    template "comment.rb", File.join('app/models', "comment.rb")
  end
end
