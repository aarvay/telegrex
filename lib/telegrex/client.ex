defmodule Telegrex.Client do

  defmacro __using__(config) do
    quote do
      @conf unquote(config)
      defp base_url, do: "https://api.telegram.org/bot"
      defp authorized_url, do: base_url <> @conf[:token]
      def bot(method, params \\ []) do
        unquote(__MODULE__).bot(authorized_url, method, params)
      end
    end
  end

  def bot(url, "getMe", params) do
    url = url <> "/getMe"
    request(url, params)
  end

  def request(url, params, verb \\ :get, headers \\[]) do
    url = String.to_char_list(url)
    opts = params[:httpc_opts] || []

    IO.puts url 
    case verb do
      :get ->
        :httpc.request(:get, {url, headers}, opts, body_format: :binary)
    end
  end

end
