class PostsController < ApplicationController
  
  def index
    if (params[:records])
      source = PhpbbTopic.find(:all).take(params[:records])
    else
      source = PhpbbTopic.find(:all)
    end
    
    @posts = source.collect {|phpbb_topic| Post.new(phpbb_topic)}
    render :json => @posts
  end
end