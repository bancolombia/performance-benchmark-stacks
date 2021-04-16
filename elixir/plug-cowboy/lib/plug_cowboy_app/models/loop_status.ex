defmodule Models.LoopStatus do
  @moduledoc false

  defstruct [
    status: "",
    applied: false,
    times: 0,
  ]

  def ok(applied, times) do
    %__MODULE__{
      status: "OK",
      applied: applied,
      times: times
    }
  end

end
