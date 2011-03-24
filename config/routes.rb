Graph::Application.routes.draw do

  scope "/:domain(/)", :constraints => { :domain => /.*/ } do
    match "profile(.:format)" => "graph#profile"
    match "usedby(.:format)" => "graph#usedby"
    match "uses(.:format)" => "graph#uses"
  end

end
