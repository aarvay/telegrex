defmodule Telegrex do
  import Telegrex.API

  @method_type_mapping %{
    "getMe" => Telegrex.Type.User
  }

  @spec get_me(binary) :: {:ok, Telegrex.Type.User.t}
  def get_me(token) when is_binary(token) do
    call(token, "getMe")
  end

  @spec get_me(Telegrex.Bot.t) :: {:ok, Telegrex.Type.User.t}
  def get_me(bot) when is_map(bot) do
    call(bot.token, "getMe")
  end

  def typecast(input, method) do
    Poison.encode!(input)
    |> Poison.decode!(as: @method_type_mapping[method])
  end
end
