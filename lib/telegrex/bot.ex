defmodule Telegrex.Bot do
  defstruct token: nil, info: nil

  @type t :: %Telegrex.Bot{token: binary, info: Telegrex.Type.User.t}

  @spec new(binary) :: {:ok, t} | {:error, Telegrex.Error.t}
  def new(token) do
    result = Telegrex.get_me token
    case result do
      {:ok, user} -> {:ok, %Telegrex.Bot{token: token, info: user}}
      {:error, error} -> {:error, error}
    end
  end

  def new!(token) do
    result = new token
    case result do
      {:ok, bot} -> bot
      {:error, error} ->
        raise error
    end
  end
end
