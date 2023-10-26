defmodule Vlog.Repo do
  use Ecto.Repo,
    otp_app: :vlog,
    adapter: Ecto.Adapters.MyXQL
end
