Rails.application.routes.draw do
    root 'pages#index'
    get '404', to: 'pages#index'

    namespace :api do

    end
end
