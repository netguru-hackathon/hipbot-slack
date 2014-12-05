class ApplicationController < ActionController::Base
  def slack
    Rails.logger.info(params)
    Rails.logger.info(params[:user_name])
    Rails.logger.info(params[:user_id])
    if params[:user_name] !~ /bot/
      Rails.logger.info('not a bot')
      # SlackConnector.message(nil, "Got it, #{params[:text]}")
    end
    render nothing: true
  end
end
