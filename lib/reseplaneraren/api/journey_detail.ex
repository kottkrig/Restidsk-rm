# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule Reseplaneraren.Api.JourneyDetail do
  @moduledoc """
  API calls for all endpoints tagged `JourneyDetail`.
  """

  alias Reseplaneraren.Connection
  import Reseplaneraren.RequestBuilder


  @doc """
  Returns information about the complete route of a trip.
  Delivers information about the complete route of a trip. This service can not be called directly but only by reference URLs in a result of a trip or departureBoard request. It contains a list of all stops/stations of this journey including all departure and arrival times (with real-time data if available) and additional information like specific attributes about facilities and other texts.

  ## Parameters

  - connection (Reseplaneraren.Connection): Connection to server
  - ref (String.t): the ref query parameter, URL decoded, from a URL retrieved as a result of a trip or or departureBoard request
  - opts (KeywordList): [optional] Optional parameters

  ## Returns

  {:ok, %Reseplaneraren.Model.JourneyDetail{}} on success
  {:error, info} on failure
  """
  @spec get_journey_detail(Tesla.Env.client, String.t, keyword()) :: {:ok, Reseplaneraren.Model.JourneyDetail.t} | {:error, Tesla.Env.t}
  def get_journey_detail(connection, ref, _opts \\ []) do
    %{}
    |> method(:get)
    |> url("/journeyDetail")
    |> add_param(:query, :"ref", ref)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> decode(%Reseplaneraren.Model.JourneyDetail{})
  end
end
