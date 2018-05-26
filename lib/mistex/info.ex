defmodule Mistex.Info do
  @moduledoc """
  Functions to get information from the robot
  """


  @doc """
  Get Device Info
  """
  def device(client) do
    {:ok, res } = Mistex.get(client.api_base <> "/info/device")

    res
    |> Mistex.parse_res
    |> List.first
  end

  @doc """
  Get Battery info
  """
  def battery(client) do
    {:ok, res } = Mistex.get(client.api_base <> "/info/battery")

    result =
    res
    |> Mistex.parse_res
    |> List.first

    result.result
  end


  @doc """
  Get available WiFi access points
  """
  def wifi(client) do
  {:ok, res } = Mistex.get(client.api_base <> "/info/wifi")

    result =
    res
    |> Mistex.parse_res
    |> List.first

    result.result
  end

  @doc """
  Get Endpoint Help
  """
  def help(client) do
    {:ok, res} = Mistex.get(client.api_base <> "/info/help")

    result =
    res
    |> Mistex.parse_res
    |> List.first

    {:ok, list} =
    result.result
    |> Poison.decode

    get_items=
    for item <- list["get"] do
      item["endpoint"]
    end

    post_items=
    for item <- list["post"] do
      item["endpoint"]
    end

    %{
      get_items: get_items,
      post_items: post_items
    }

  end


  @doc """
  Get specific endpoint help
  """
  def endpoint_help(client, endpoint) do
    {:ok, res } = Mistex.get(client.api_base <> "/info/help?command="<> endpoint)

      result =
      res
      |> Mistex.parse_res
      |> List.first

      {:ok, decoded}=
      result.result
      |> Poison.decode

      decoded
    end





end
