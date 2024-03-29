class MessagesController < ApplicationController
  before_action :require_user
  

  def create
# start a rails server?  https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/learn/lecture/13116594#questions/12271030
    message = current_user.messages.build(message_params)
    if message.save 
      ActionCable.server.broadcast("chatroom_channel", {message:message_render(message)})
    end  
  end  

  private 
  def message_params 
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: {message:message})
  end 

end
