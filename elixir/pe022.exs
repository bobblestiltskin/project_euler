defmodule ProjectEuler do
  def pe022() do
    {:ok, contents} = File.read("../names.txt")
    names = contents |> String.split(",", trim: true)
    new = for name <- names do
      String.replace(name, ~r/\"/, "", global: true)
    end
    sorted = Enum.sort(new)
    sum_name_scores(sorted, 1, 0)
  end
   
  defp sum_name_scores([head|tail], count, sum) do
    score = compute_score(to_charlist(head), 0, count)
    sum_name_scores(tail, count + 1, sum + score)
  end

  defp sum_name_scores([], _, sum) do
    sum
  end

  defp compute_score([head|tail], score, count) do
    compute_score(tail, score + head - 64,  count)
  end

  defp compute_score([], score, count) do
    score * count
  end
end

IO.puts(ProjectEuler.pe022())
