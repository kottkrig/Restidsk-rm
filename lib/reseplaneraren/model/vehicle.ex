# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule Reseplaneraren.Model.Vehicle do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"lcolor",
    :"prodClass",
    :"bcolor",
    :"direction",
    :"name",
    :"gid",
    :"delay",
    :"y",
    :"x"
  ]

  @type t :: %__MODULE__{
    :"lcolor" => String.t,
    :"prodClass" => String.t,
    :"bcolor" => String.t,
    :"direction" => integer(),
    :"name" => String.t,
    :"gid" => String.t,
    :"delay" => integer(),
    :"y" => float(),
    :"x" => float()
  }
end

defimpl Poison.Decoder, for: Reseplaneraren.Model.Vehicle do
  def decode(value, _options) do
    value
  end
end

