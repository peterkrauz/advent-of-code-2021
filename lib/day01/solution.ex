defmodule Day01.Solution do
  use InputReader

  def part_one() do
    read_input("day01")
    |> Stream.map(&String.to_integer/1)
    |> Stream.chunk_every(2, 1, :discard)
    |> Stream.filter(&measurement_increases/1)
    |> Enum.count
  end

  defp measurement_increases([left_measurement, right_measurement]) do
    left_measurement < right_measurement
  end

  def part_two() do
    read_input("day01")
    |> Stream.map(&String.to_integer/1)
    |> Stream.chunk_every(3, 1, :discard)
    |> Stream.map(&Enum.sum/1)
    |> Stream.chunk_every(2, 1, :discard)
    |> Stream.filter(&measurement_increases/1)
    |> Enum.count
  end
end
