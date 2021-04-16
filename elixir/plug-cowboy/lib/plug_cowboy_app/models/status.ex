defmodule Models.Status do
  @moduledoc false

  defstruct [
    status: ""
  ]

  def up() do
    %__MODULE__{
      status: "UP"
    }
  end

  def down() do
    %__MODULE__{
      status: "DOWN"
    }
  end

end
