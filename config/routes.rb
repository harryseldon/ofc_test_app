ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/:action/:id'
  map.root :controller => 'test_it', :action => 'all_graphs'
end
