defmodule Telegrex.API do
  alias Telegrex.Error

  @base_url "https://api.telegram.org/bot"
  @type result :: {:ok, map} | {:error, Error.t}

  @spec call(binary, binary, list) :: result
  def call(token, method, params \\ []) do
    authorized_endpoint(token, method)
    |> HTTPoison.post({:form, params})
    |> normalize_response(method)
  end

  @spec authorized_endpoint(binary, binary) :: binary
  defp authorized_endpoint(token, method) do
    @base_url <> token <> "/" <> method
  end

  @spec normalize_response(HTTPoison.Response.t, binary) :: result
  defp normalize_response(response, method) do
    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        case Poison.decode!(body, keys: :atoms) do
          %{ok: true, result: result} ->
            {:ok, Telegrex.typecast(result, method)}
          %{ok: false, description: message} ->
            {:error, %Error{message: message}}
        end
      {:ok, %HTTPoison.Response{status_code: 401}} ->
        {:error, %Error{message: "Invalid authenticaion token"}}
      {:error, %HTTPoison.Error{reason: message}} ->
        {:error, %Error{message: message}}
    end
  end
end
