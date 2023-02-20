defmodule Utils.Crypt do
  @moduledoc false

  def encrypt(plain) do
    Bcrypt.Base.hash_password(plain, Bcrypt.gen_salt(10, true))
  end

  def validate(plain, hash) do
    Bcrypt.verify_pass(plain, hash)
  end

end
