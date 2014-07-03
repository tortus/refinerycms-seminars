Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :seminars do
    resources :seminars, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :seminars, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :seminars, :except => :show do
        collection do
          post :update_positions
        end
        resources :dates
      end
    end
  end

end
