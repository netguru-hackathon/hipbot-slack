class ApplicationController < ActionController::Base
  def slack
    Rails.logger.info(params)
    Rails.logger.info(params[:user_name], params[:user_id])
    if params[:user_name] !~ /bot/i
      # SlackConnector.message(nil, "Got it, #{params[:text]}")
    end
    render nothing: true
  end
end
