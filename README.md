<!--
 * @Date: 2021-05-14 15:55:52
 * @LastEditors: viletyy
 * @LastEditTime: 2021-06-02 18:51:43
 * @FilePath: /acts_as_able/README.md
-->
# ActsAsAble

这就是一个给国人用的 关注、浏览、点赞等有关的 Gem 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'acts_as_able'
```

And then execute:

    $ bundle

## Usage

### 关注功能
```ruby
rails g acts_as_followable
rails db:migrate
```

以下方法可以放在需要使用的类中:
```ruby
acts_as_followable  #被关注
acts_as_follower    #关注者


class Article < ApplicationRecord
  acts_as_followable
end

class User < ApplicationRecord
  acts_as_follower
end
```

acts_as_followable
```ruby
acts_as_followable

#找出某个模型关注我的所有的对象
Article.last.followers_by_type(User)
```

acts_as_follower
```ruby
acts_as_follower

# 关注某个模型的某个对象
User.first.follow(Article.first)
# 万恶的取关
User.first.unfollow(Article.first)
# 查看是否关注某个对象
User.first.follow?(Article.first)
# 查看关注模型的所有对象
User.first.followings(Article)
```

### 浏览功能
```ruby
rails g acts_as_viewable
rails db:migrate
```

以下方法可以放在需要使用的类中:
```ruby
acts_as_viewable  #被浏览
acts_as_viewer    #浏览者


class Article < ApplicationRecord
  acts_as_viewable
end

class User < ApplicationRecord
  acts_as_viewer
end
```

acts_as_viewable
```ruby
acts_as_viewable

#找出某个模型浏览我的所有的对象
Article.last.viewers_by_type(User)
```

acts_as_viewer
```ruby
acts_as_viewer

# 浏览某个模型的某个对象
User.first.view(Article.first)
# 查看是否浏览某个对象
User.first.view?(Article.first)
# 查看某种类型浏览的所有对象
User.first.viewings(Article)
```

### 点赞功能
```ruby
rails g acts_as_likable
rails db:migrate
```

以下方法可以放在需要使用的类中:
```ruby
acts_as_likable  #被点赞
acts_as_liker    #点赞者


class Article < ApplicationRecord
  acts_as_likable
end

class User < ApplicationRecord
  acts_as_liker
end
```

acts_as_likable
```ruby
acts_as_likable

#找出某个模型点赞我的所有的对象
Article.last.likers_by_type(User)
```

acts_as_liker
```ruby
acts_as_liker

# 点赞某个模型的某个对象
User.first.like(Article.first)
# 取消某个对象的点赞
User.first.unlike(Article.first)
# 查看是否点赞某个对象
User.first.like?(Article.first)
# 查看点赞模型的所有对象
User.first.likings(Article)
```

### 踩功能
```ruby
rails g acts_as_dissable
rails db:migrate
```

以下方法可以放在需要使用的类中:
```ruby
acts_as_dissable  #被踩
acts_as_disser    #踩者


class Article < ApplicationRecord
  acts_as_dissable
end

class User < ApplicationRecord
  acts_as_disser
end
```

acts_as_dissable
```ruby
acts_as_dissable

#找出某个模型点赞我的所有的对象
Article.last.dissers_by_type(User)
```

acts_as_disser
```ruby
acts_as_disser

# 踩某个模型的某个对象
User.first.diss(Article.first)
# 取消某个对象的踩
User.first.undiss(Article.first)
# 查看是否踩了某个对象
User.first.diss?(Article.first)
# 查看踩模型的所有对象
User.first.dissings(Article)
```

### 评论功能
```ruby
rails g acts_as_commentable
rails db:migrate
```

以下方法可以放在需要使用的类中:
```ruby
acts_as_commentable  #被评论
acts_as_commenter    #评论者


class Article < ApplicationRecord
  acts_as_commentable
end

class User < ApplicationRecord
  acts_as_commenter
end
```

acts_as_commentable
```ruby
acts_as_commentable

#我的所有一级评论
Article.last.root_commenters
#某个模型的一级评论
Article.last.root_commenters_by_type(User)
#找出某个模型评论我的所有的对象
Article.last.commenters_by_type(User)
```

acts_as_commenter
```ruby
acts_as_commenter

# 评论某个模型的某个对象
User.first.comment('评论内容', Article.first, nil)
# 查看是否评论某个对象或回复某个对象
User.first.comment?(Article.first)
# 查看某种类型评论的所有对象
User.first.committings(Article)

```

comment
```ruby
# 查看父级评论
Comment.first.parent_comment
# 查看子评论
Comment.first.children_comments
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
