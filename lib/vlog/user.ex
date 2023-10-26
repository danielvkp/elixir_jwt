defmodule Vlog.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Poison.Encoder, only: [:email, :password]}
  schema "users" do
    field :email, :string
    field :password, :string
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
     case changeset do
       %Ecto.Changeset{valid?: true, changes: %{password: password}}
         ->
           put_change(changeset, :password, Comeonin.Bcrypt.hashpwsalt(password))
       _ ->
           changeset
     end
  end

end
