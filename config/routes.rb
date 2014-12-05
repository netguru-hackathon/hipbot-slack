Rails.application.routes.draw do
  post :slack, to: 'application#slack'
end
