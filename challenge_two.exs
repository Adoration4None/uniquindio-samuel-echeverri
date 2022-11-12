defmodule Solution do

  @spec compress(String.t) :: String.t
  def compress(msg), do: compress( String.codepoints(msg), [], 1 )

  @spec compress([String.t], [String.t], integer) :: String.t
  defp compress([], [], _count), do: ""
  defp compress([], _stack, _count), do: ""
  defp compress([ch | rest], [], count), do: ch <> compress(rest, [ch], count)
  defp compress([ch | rest], [head | stack], count) when ch == head do
    compress(rest, [ch | [head | stack]], count + 1)
  end
  defp compress([ch | rest], [head | stack], count) when count > 1 do
    Integer.to_string(count) <> ch <> compress(rest, [ch | [head | stack]], 1)
  end
  defp compress([ch | rest], [head | stack], _count) do
    ch <> compress(rest, [ch | [head | stack]], 1)
  end

end

enter = IO.gets("")
compressed_string = Solution.compress(enter)
IO.puts(compressed_string)
