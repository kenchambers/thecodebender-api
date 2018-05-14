Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :chats
      resources :messages, :defaults => { :format => 'json' }
    end
  end
end
