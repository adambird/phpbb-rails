class PostsController < ApplicationController
  
  def index
    @posts = PhpbbTopic.find(:all).take(50).collect {|phpbb_topic| Post.new(phpbb_topic)}
    render :json => @posts
  end
end