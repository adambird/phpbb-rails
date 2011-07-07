class PhpbbTopic < ActiveRecord::Base
  set_primary_key "topic_id"
  set_table_name "phpbb_topics"

  belongs_to :user, :class_name => 'PhpbbUser', :foreign_key => 'topic_poster'
  has_many :posts, :class_name => 'PhpbbPost', :foreign_key => 'topic_id', :order => 'post_time'
  has_one :first_post, :class_name => 'PhpbbPost', :primary_key => 'topic_first_post_id', :foreign_key => 'post_id'
  has_one :last_post, :class_name => 'PhpbbPost', :primary_key => 'topic_last_post_id', :foreign_key => 'post_id'
end