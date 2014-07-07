Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :seminars do
    resources :seminars, :path => '', :only => [:index, :show] do
      resources :signups, :only => [:new, :create] do
        collection do
          get :thank_you
        end
      end
    end
  end

  # Admin routes
  namespace :seminars, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :seminars, :except => :show do
        collection do
          post :update_positions
        end
        # resources :signups, :only => [:index, :show]
        resources :dates, :only => [:destroy]
      end
    end
  end

end
