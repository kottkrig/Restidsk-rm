# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule Reseplaneraren.Model.Point do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"lon",
    :"lat"
  ]

  @type t :: %__MODULE__{
    :"lon" => String.t,
    :"lat" => String.t
  }
end

defimpl Poison.Decoder, for: Reseplaneraren.Model.Point do
  def decode(value, _options) do
    value
  end
end

