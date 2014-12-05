class ApplicationController < ActionController::Base
  def slack
    Rails.logger.info(params[:text])
    render nothing: true
  end
end
