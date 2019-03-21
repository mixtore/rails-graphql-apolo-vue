Rails.application.routes.draw do
  root 'pages#index'
  get '404', to: 'pages#index'

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"

  get '/*path', to: 'pages#index', format: false

end
