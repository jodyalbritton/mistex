defmodule Mistex do
  @moduledoc """
  The Mistex Library provides an Elixer client to the Misty Robotics Platform API.
  """

  use HTTPoison.Base


  defmodule Client do
    @moduledoc """
    Builds a client for accessing the API
    """
    defstruct api_base: nil, headers: nil
  end

  @doc """ 
  The connect function builds your client. 
  """
  def connect(ip_address) do
    %Client{api_base: "http://"<> ip_address <>"/api", headers: nil}
  end

  @doc """
  Parse the result
  """
  def parse_res(response) do
    if response do
      if response.body do
        response.body
        |> Poison.Parser.parse!(keys: :atoms)
      end
    end
  end

end
