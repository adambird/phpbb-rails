class PostsController < ApplicationController
  
  def index
    if (params[:id])
      source = PhpbbTopic.where("topic_id = ?", params[:id])
    else
      if (params[:records])
        source = PhpbbTopic.find(:all).take(params[:records].to_i)
      else
        source = PhpbbTopic.find(:all)
      end
    end
    @posts = source.collect {|phpbb_topic| Post.new(phpbb_topic)}
    render :json => @posts
  end
end