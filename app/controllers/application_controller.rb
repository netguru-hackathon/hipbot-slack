class ApplicationController < ActionController::Base
  def slack
    Rails.logger.info(params[:text])
    SlackConnector.message(nil, "Got it, #{params[:text]}")
    render nothing: true
  end
end
