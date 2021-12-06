defmodule Presents do
  def next_location({x, y}, "^"), do: {x, y + 1} 
  def next_location({x, y}, "<"), do: {x - 1, y} 
  def next_location({x, y}, ">"), do: {x + 1, y} 
  def next_location({x, y}, "v"), do: {x, y - 1} 
  def next_location({x, y}, _), do: {x, y} 

  def process([], loc_set, _loc), do: loc_set

  def process([head | tail], loc_set, loc), do: process(tail, MapSet.put(loc_set, next_location(loc, head)), next_location(loc, head))
end

Presents.process(String.graphemes(File.read!("input")), MapSet.new(), {0, 0})
|> MapSet.size
|> IO.puts
