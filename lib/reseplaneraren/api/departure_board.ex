# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule Reseplaneraren.Api.DepartureBoard do
  @moduledoc """
  API calls for all endpoints tagged `DepartureBoard`.
  """

  alias Reseplaneraren.Connection
  import Reseplaneraren.RequestBuilder


  @doc """
  Return the next 20 departures (or less if not existing) from a given point in time or the next departures in a given timespan.
  This method will return the next 20 departures (or less if not existing) from a given point in time or the next departures in a given timespan. The service can only be called for stops/stations by using according ID retrieved by the location method. The parameter is called id. The time and date are defined with the parameters date and time.

  ## Parameters

  - connection (Reseplaneraren.Connection): Connection to server
  - id (integer()): stop id
  - date (Date.t): the date
  - time (String.t): the time in format HH:MM
  - opts (KeywordList): [optional] Optional parameters
    - :use_vas (String.t): to exclude trips with Västtågen, set this parameter to 0.
    - :use_ld_train (String.t): to exclude trips with long distance trains, set this parameter to 0.
    - :use_reg_train (String.t): to exclude trips with regional trains, set this parameter to 0.
    - :use_bus (String.t): to exclude trips with buses, set this parameter to 0.
    - :use_boat (String.t): to exclude trips with boats, set this parameter to 0.
    - :use_tram (String.t): to exclude trips with trams, set this parameter to 0.
    - :exclude_dr (String.t): to exclude journeys which require tel. registration, set this parameter to 0.
    - :time_span (integer()): to get the next departures in a specified timespan of up to 24 hours (unit: minutes). If this parameter is not set, the result will contain the next 20 departures.
    - :max_departures_per_line (integer()): if timeSpan is set you can further reduce the number of returned journeys by adding this parameter, which will cause only the given number of journeys for every combination of line and direction.
    - :need_journey_detail (String.t): if the reference URL for the journey detail service is not needed in the result, set this parameter to 0
    - :direction (integer()): stop id in order to get only departures of vehicles with a specified direction
    - :format (String.t): the required response format
    - :jsonp_callback (String.t): If JSONP response format is needed, you can append an additional parameter to specify the name of a callback function, and the JSON object will be wrapped by a function call with this name.

  ## Returns

  {:ok, %Reseplaneraren.Model.DepartureBoard{}} on success
  {:error, info} on failure
  """
  @spec get_departure_board(Tesla.Env.client, integer(), Date.t, String.t, keyword()) :: {:ok, Reseplaneraren.Model.DepartureBoard.t} | {:error, Tesla.Env.t}
  def get_departure_board(connection, id, date, time, opts \\ []) do
    optional_params = %{
      :"useVas" => :query,
      :"useLDTrain" => :query,
      :"useRegTrain" => :query,
      :"useBus" => :query,
      :"useBoat" => :query,
      :"useTram" => :query,
      :"excludeDR" => :query,
      :"timeSpan" => :query,
      :"maxDeparturesPerLine" => :query,
      :"needJourneyDetail" => :query,
      :"direction" => :query,
      :"format" => :query,
      :"jsonpCallback" => :query
    }
    %{}
    |> method(:get)
    |> url("/departureBoard")
    |> add_param(:query, :"id", id)
    |> add_param(:query, :"date", date)
    |> add_param(:query, :"time", time)
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> decode(%Reseplaneraren.Model.DepartureBoard{})
  end
end