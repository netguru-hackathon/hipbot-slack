class ApplicationController < ActionController::Base
  def slack
    Rails.logger.info(params)
    if params[:user_name] !~ /bot/
      message = params[:text].to_s.gsub(/<@U02QF8ZSD>:?/, '@hipbot') # HACK
      sender = Hipbot::User.find_or_create_by(name: params[:user_name])
      room = Hipbot::Room.find_or_create_by(name: params[:channel_name])
      HipbotNetguru.instance.react(sender, room, message)
    end
    render nothing: true
  end
end
