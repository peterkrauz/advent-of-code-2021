defmodule InputReader do
  defmacro __using__(_args) do
    quote do
      defp read_input(path) do
        File.read!("#{File.cwd!}/lib/#{path}/input.txt") |> String.split("\n")
      end
    end
  end
end
