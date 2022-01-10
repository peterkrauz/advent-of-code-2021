defmodule InputReader do
  defmacro __using__(_args) do
    quote do
      defp read_input(path) do
        base_dir = File.cwd!
        File.read!("#{base_dir}/lib/#{path}/input.txt")
        |> String.split("\n")
      end
    end
  end
end
