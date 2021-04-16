defmodule Services.Crypt do
  import Utils.Crypt
  import UUID
  @moduledoc false

  def process do
    plain = uuid4()
    hash = encrypt(plain)
    true = validate(plain, hash)
  end

end
