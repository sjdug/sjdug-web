SjdugWeb::Application.routes.draw do
  post '/subscribe', to: 'mailing_list#subscribe', as: 'subscribe'
  root 'home#index'
end
