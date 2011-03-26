Graph::Application.routes.draw do

  scope "/v1" do
    scope "/:domain", :constraints => { :domain => /[\w.-]+/ } do
      match "(/)" => "graph#index"
      match "/profile(.:format)" => "graph#profile"
      match "/usedby(.:format)" => "graph#usedby"
      match "/uses(.:format)" => "graph#uses"
    end
  end

end
