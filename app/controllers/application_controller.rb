class ApplicationController < ActionController::Base
  def slack
    Rails.logger.info(params)
    if params[:user_name] !~ /bot/i
      SlackConnector.message(nil, "Got it, #{params[:text]}")
    end
    render nothing: true
  end
end
