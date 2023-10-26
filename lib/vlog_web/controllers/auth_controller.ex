defmodule VlogWeb.AuthController do
  use VlogWeb, :controller
  alias Vlog.Accounts
  alias Vlog.User .{Repo, User}

  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  def sign_in(conn,  %{"email" => email, "password" => password}) do
    case Accounts.token_sign_in(email, password) do
      {:ok, token, _claims} ->
        send_resp conn, 200, Poison.encode!(%{token: token})
       _ ->
        send_resp conn, 200, Poison.encode!(%{error: :unauthorized})
    end
  end

end
