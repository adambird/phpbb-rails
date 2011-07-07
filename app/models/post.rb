class Post
  attr_accessor :user, :title, :body, :replies, :created_at, :last_updated_at, :section
  
  def initialize(phpbb_topic)
    @user = phpbb_topic.user.user_email
    @title = phpbb_topic.topic_title
    first_post = phpbb_topic.first_post
    @body = first_post.body.clean_body if !phpbb_topic.posts.empty?
    @created_at = Time.at(phpbb_topic.topic_time).getutc
    @last_update_at = phpbb_topic.last_post ? Time.at(phpbb_topic.last_post.post_time).getutc : @created_at
    @section = phpbb_topic.forum.forum_name if phpbb_topic.forum
    
    @replies = []
    phpbb_topic.posts.each do |post|
      @replies<<Reply.new(post) if post.post_id != first_post.post_id
    end
  end
end