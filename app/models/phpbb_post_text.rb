class PhpbbPostText < ActiveRecord::Base
  set_primary_key "post_id"
  set_table_name "phpbb_posts_text"
  
  def clean_body
    post_text
  end
end