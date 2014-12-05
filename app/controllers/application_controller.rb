class ApplicationController < ActionController::Base
  def slack
    Rails.logger.info(params)
    if params[:user_name] !~ /bot/
      sender = Hipbot::User.find_or_create_by(name: params[:user_name])
      room = Hipbot::Room.find_or_create_by(name: params[:channel_name])
      HipbotNetguru.instance.react(sender, room, params[:text])
    end
    render nothing: true
  end
end
