defmodule LdQWeb.Router do
  use LdQWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {LdQWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/vitrine", LdQWeb do
    pipe_through :browser
    get "/:page_id", ShowcaseController, :shower
    get "/", ShowcaseController, :home
  end

  scope "/comite", LdQWeb do
    pipe_through :browser
    get "/", ComiteController, :home
  end

  scope "/arena", LdQWeb do
    pipe_through :browser
    get "/", ArenaController, :home
  end

  scope "/biblio", LdQWeb do
    pipe_through :browser

    get "/", LibraryController, :home
  end

  scope "/", LdQWeb do
    pipe_through :browser

    resources "/books", BookController
    resources "/book_cards", BCardController
    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  # scope "/api", LdQWeb do
  #   pipe_through :api
  # end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:ldq, :dev_routes) do

    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
