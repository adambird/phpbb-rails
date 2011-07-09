class PhpbbPostText < ActiveRecord::Base
  set_primary_key "post_id"
  set_table_name "phpbb_posts_text"
  
  def clean_body
    if post_text
      post_text.gsub(/\[(\/)?\w*((:\w*)|(url=[\w]*:\/\/[\w\.\/\-\%]*))?\]/, '')
    end
  end
end