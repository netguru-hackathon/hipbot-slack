class ApplicationController < ActionController::Base
  def slack
    Rails.logger.info(params)
    if params[:user_name] !~ /bot/
      room = Hipbot::Room.find_or_create_by(name: params[:channel_name])
      HipbotNetguru.instance.send_to_room(room, "Got it, #{params[:text]}")
    end
    render nothing: true
  end
end
