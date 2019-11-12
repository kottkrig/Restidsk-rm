# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule Reseplaneraren.Model.TimeTablePeriod do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"DateBegin",
    :"DateEnd"
  ]

  @type t :: %__MODULE__{
    :"DateBegin" => DateBegin,
    :"DateEnd" => DateEnd
  }
end

defimpl Poison.Decoder, for: Reseplaneraren.Model.TimeTablePeriod do
  import Reseplaneraren.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:"DateBegin", :struct, Reseplaneraren.Model.DateBegin, options)
    |> deserialize(:"DateEnd", :struct, Reseplaneraren.Model.DateEnd, options)
  end
end

