defmodule Joken.Claim do
  @moduledoc """
  Structure for a dynamic claim. It is used for holding functions that generate 
  and validate claims.
  """
  defstruct generate: nil,
            validate: nil,
            options: []

  @doc false
  def __generate_claim__({key, %__MODULE__{generate: gen_fun}}, acc)
      when is_function(gen_fun) and is_binary(key) and is_map(acc) do
    case Map.has_key?(acc, key) do
      true ->
        acc

      _ ->
        Map.put(acc, key, gen_fun.())
    end
  end
end
