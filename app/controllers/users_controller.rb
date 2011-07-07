class UsersController < ApplicationController
  
  def index
    @users = PhpbbUser.find(:all).collect {|phpbb_user| User.new(phpbb_user)}
    render :json => @users
  end
end