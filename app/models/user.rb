class User
  attr_accessor :username, :email
  
  def initialize(phpbb_user)
    @username = phpbb_user.username
    @email = phpbb_user.user_email
  end
end