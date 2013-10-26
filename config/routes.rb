SjdugWeb::Application.routes.draw do
  root 'home#index'
  post 'api/subscribe'
end