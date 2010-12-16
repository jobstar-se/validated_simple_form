ValidateFormApp::Application.routes.draw do
  resources :tracks
  root :to => "tracks#new"
end
