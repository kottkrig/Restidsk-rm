# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule Reseplaneraren.Model.TimeTableData do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"CreationDate"
  ]

  @type t :: %__MODULE__{
    :"CreationDate" => CreationDate
  }
end

defimpl Poison.Decoder, for: Reseplaneraren.Model.TimeTableData do
  import Reseplaneraren.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:"CreationDate", :struct, Reseplaneraren.Model.CreationDate, options)
  end
end

