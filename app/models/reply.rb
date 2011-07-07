class Reply
  attr_accessor :user, :body, :created_at, :last_updated_at
  
  def initialize(phpbb_post)
    @user = phpbb_post.user.user_email
    @body = phpbb_post.body.clean_body
    @created_at = Time.at(phpbb_post.post_time).getutc
    @last_updated_at = phpbb_post.post_edit_time ? Time.at(phpbb_post.post_edit_time).getutc : @created_at
  end
end