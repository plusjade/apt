Graph::Application.routes.draw do

  scope "/:domain(/)", :constraints => { :domain => /.*/ } do
    match "profile(.:format)" => "graph#profile"
    match "uses(.:format)" => "graph#uses"
    match "usedby(.:format)" => "graph#usedby"
  end

end
