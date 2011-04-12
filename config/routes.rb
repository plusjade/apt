Graph::Application.routes.draw do
  
  devise_for :accounts, :controllers => {:registrations => 'registrations'}
  
  root :to => "static#home"
  
  scope "/v1", :as => "v1" do
    scope "/:domain", :constraints => { :domain => /[^\/]+\.[a-zA-Z]+/ }, :controller => :graph, :as => "domain" do
      get "(/)"                 ,:action => "index", :as => "index"
      get "/profile(.:format)"  ,:action => "profile", :as => "profile"
      get "/usedby(.:format)"   ,:action => "usedby", :as => "usedby"
      get "/uses(.:format)"     ,:action => "uses", :as => "uses"
      
      resources :users
    end
  end

  get "/:domain", :constraints => { :domain => /[^\/]+\.[a-zA-Z]+/ }, :controller => :graph, :action => "index", :as => "domain_index"
  
end
