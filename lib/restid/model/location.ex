defmodule Restid.Model.Location do
  @enforce_keys [:name, :long, :lat]
  defstruct [:name, :long, :lat]
end
