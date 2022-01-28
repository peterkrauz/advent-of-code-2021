defmodule Day02.Solution do
  use InputReader

  def part_one() do
    read_input("day02")
    |> Enum.reduce([0, 0], &move_submarine/2)
    |> then(fn [h_pos, depth] -> h_pos * depth end)
  end

  def move_submarine(step, acc) do
    step
    |> String.split(" ")
    |> Stream.chunk_every(2, 2)
    |> Enum.map(fn [move, units] -> [move, String.to_integer(units)] end)
    |> accumulate_move(acc)
  end

  def accumulate_move([["forward", units]], [h_pos, depth]), do: [h_pos + units, depth]
  def accumulate_move([["down", units]], [h_pos, depth]), do: [h_pos, depth + units]
  def accumulate_move([["up", units]], [h_pos, depth]), do: [h_pos, depth - units]

  def part_two() do
    read_input("day02")
    |> Enum.reduce([0, 0, 0], &move_submarine_with_aim/2)
    |> then(fn [h_pos, depth, _] -> h_pos * depth end)
  end

  def move_submarine_with_aim(step, acc) do
    step
    |> String.split(" ")
    |> Stream.chunk_every(2, 2)
    |> Enum.map(fn [move, units] -> [move, String.to_integer(units)] end)
    |> accumulate_move_with_aim(acc)
  end

  def accumulate_move_with_aim([["forward", units]], [h_pos, depth, aim]) do
    [h_pos + units, depth + get_depth_increase(aim, units), aim]
  end

  def accumulate_move_with_aim([["down", units]], [h_pos, depth, aim]) do
    [h_pos, depth, aim + units]
  end

  def accumulate_move_with_aim([["up", units]], [h_pos, depth, aim]) do
    [h_pos, depth, aim - units]
  end

  defp get_depth_increase(0, _), do: 0
  defp get_depth_increase(aim, units), do: aim * units
end
