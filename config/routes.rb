Graph::Application.routes.draw do

  scope "/v1", :as => "v1" do
    scope "/:domain", :constraints => { :domain => /[^\/]+/ }, :controller => :graph, :as => "domain" do
      get "(/)"                 ,:action => "index", :as => "index"
      get "/profile(.:format)"  ,:action => "profile", :as => "profile"
      get "/usedby(.:format)"   ,:action => "usedby", :as => "usedby"
      get "/uses(.:format)"     ,:action => "uses", :as => "uses"
      
      resources :users
    end
  end

end
