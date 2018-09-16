Rails.application.routes.draw do

  routes_block = lambda do

    dashboard = Typus.subdomain ? "/dashboard" : "/admin/dashboard"

    get "/" => redirect(dashboard)
    get "dashboard" => "dashboard#index", :as => "dashboard_index"
    get "dashboard/:application" => "dashboard#show", :as => "dashboard"

    if Typus.authentication == :session
      resource :session, :only => [:new, :create], :controller => :session do
        delete :destroy, :as => "destroy"
      end

      resources :account, :only => [:new, :create, :show] do
        collection do
          get :forgot_password
          post :send_password
        end
      end
    end

    controllers = Typus.models.map(&:to_resource) + Typus.resources.map(&:underscore)
    controllers.each { |c| get "#{c}(/:action(/:id))(.:format)", :controller => c }

  end

  if Typus.subdomain
    constraints :subdomain => Typus.subdomain do
      namespace :admin, :path => "", &routes_block
    end
  else
    scope "admin", {:module => :admin, :as => "admin"}, &routes_block
  end

end
