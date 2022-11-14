defmodule AdventOfCode.Day01 do
  def part1(args) do
    input = input(args)
    count_increase(tl(input), fn (a, b) -> a > b end, {hd(input), 0})
  end

  def part2(args) do
    input = input(args)
    sums = sum_sliding_threes(input, [])
    count_increase(tl(sums), fn (a, b) -> a > b end, {hd(sums), 0})
  end

  def input(args) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(fn a -> List.to_integer(String.to_charlist(a)) end)
  end

  def count_increase([], _fun, {_last, acc}) do
    acc
  end
  def count_increase([h | t], fun, {last, acc}) do
    case fun.(h, last) do
      true ->
        count_increase(t, fun, {h, acc + 1})
      false ->
        count_increase(t, fun, {h, acc})
    end
  end

  def sum_sliding_threes([_, _], acc) do
    Enum.reverse(acc)
  end
  def sum_sliding_threes([a,b,c | t], acc) do
    sum_sliding_threes([b , c | t], [a + b + c | acc])
  end
end
