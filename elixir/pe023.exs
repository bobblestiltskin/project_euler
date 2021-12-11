defmodule ProjectEuler do
  def pe023(n) do
    {list, map} = compute_data(n, [], %{})
    map[hd(list)]
    start_sum = start_vals(hd(list) - 1, 0)
    check_each_value(n, hd(list), list, map, start_sum)
  end
   
  defp check_each_value(n, value, list, map, sum) when value < n do
    new_sum = check_each_abundant_value(value, list, map, sum)
    check_each_value(n, value + 1, list, map, new_sum)
  end

  defp check_each_value(_, _, _, _, sum) do
    sum
  end

  defp check_each_abundant_value(value, [head|tail], map, sum) do
    if head >= value do
      check_each_abundant_value(value, [], map, sum + value)
    else
      if Map.has_key?(map, value - head) do
        check_each_abundant_value(value, [], map, sum)
      else
        check_each_abundant_value(value, tail, map, sum)
      end
    end
  end

  defp check_each_abundant_value(_, [], _, sum) do
    sum
  end

  defp start_vals(x, sum) when x > 0 do
    start_vals(x - 1, sum + x)
  end
   
  defp start_vals(_, sum) do
    sum
  end
   
  defp compute_data(n, list, map) when n > 0 do
    root = Kernel.round :math.sqrt(n) + 1
    fsum = sum_factors(n, root, 2, 1)
    if n < fsum do
      adict = Map.put map, n, fsum
      compute_data(n - 1, [n | list], adict)
    else
      compute_data(n - 1, list, map)
    end
  end

  defp compute_data(_, list, map) do
    {list, map}
  end

  defp sum_factors(n, root, count, sum) when count < root do
    if rem(n, count) == 0 do
      divisor = div(n, count)
      if count == divisor do
        sum_factors(n, root, count + 1, sum + count)
      else
        sum_factors(n, root, count + 1, sum + count + divisor)
      end
    else
      sum_factors(n, root, count + 1, sum)
    end
  end

  defp sum_factors(_, _, _, sum) do
    sum
  end
end

IO.puts(ProjectEuler.pe023(28123))
