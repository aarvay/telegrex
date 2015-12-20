defmodule Telegrex.Error do

  @moduledoc """
  Defines a univeral exception type for Telegrex
  """

  defexception message: nil
  @type t :: %Telegrex.Error{message: binary}
end
