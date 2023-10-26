defmodule Vlog.Guardian.AuthPipeline do
    use Guardian.Plug.Pipeline, otp_app: :Blog,
    module: Blog.Guardian,
    error_handler: Vlog.AuthErrorHandler

    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.EnsureAuthenticated
    plug Guardian.Plug.LoadResource
end
