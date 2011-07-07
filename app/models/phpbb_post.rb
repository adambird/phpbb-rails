class PhpbbPost < ActiveRecord::Base
  set_primary_key "post_id"
  set_table_name "phpbb_posts"

  belongs_to :user, :class_name => 'PhpbbUser', :foreign_key => 'poster_id'
  has_one :body, :class_name => 'PhpbbPostText', :foreign_key => 'post_id'
end