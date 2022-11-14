defmodule AdventOfCode.Day02 do
  def part1(args) do
    input = input(args)
    {horizontal, depth, {_depth_with_aim, _aim}} = plan_course(input, {0, 0, {0, 0}})
    horizontal * depth
  end

  def part2(args) do
    input = input(args)
    {horizontal, _depth, {depth_with_aim, _aim}} = plan_course(input, {0, 0, {0, 0}})
    horizontal * depth_with_aim
  end

  def input(args) do
    args
    |> String.split()
    |> Enum.map(fn a ->
                  case a do
                    "forward" -> "forward"
                    "down" -> "down"
                    "up" -> "up"
                    _ -> List.to_integer(String.to_charlist(a))
                  end
                end)
  end

  def plan_course([], acc) do
    acc
  end
  def plan_course(["forward", x | t], {horizontal, depth, {depth_with_aim, aim}}) do
    plan_course(t, {horizontal + x, depth, {depth_with_aim + aim * x, aim}})
  end
  def plan_course(["down", x | t], {horizontal, depth, {depth_with_aim, aim}}) do
    plan_course(t, {horizontal, depth + x, {depth_with_aim, aim + x}})
  end
  def plan_course(["up", x | t], {horizontal, depth, {depth_with_aim, aim}}) do
    plan_course(t, {horizontal, depth - x, {depth_with_aim, aim - x}})
  end

end
