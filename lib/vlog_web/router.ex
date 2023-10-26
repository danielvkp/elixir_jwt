defmodule VlogWeb.Router do
  use VlogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Vlog.Guardian.AuthPipeline
  end

  scope "/", VlogWeb do
    pipe_through :browser
    get "/", PageController, :index
  end

  scope "/api", VlogWeb do
    pipe_through :api
    post "/signin", AuthController, :sign_in
  end

  scope "/api/v1", VlogWeb do
    pipe_through [:api, :jwt_authenticated]
    get "/urlprotegida", AuthController, :test
  end

end
