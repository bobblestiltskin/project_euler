# <p>Using <a href="project/resources/p022_names.txt">names.txt</a> (right click and "Save Link/Target As..."), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.</p>
# <p>For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.</p>
# <p>What is the total of all the name scores in the file?</p>

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
