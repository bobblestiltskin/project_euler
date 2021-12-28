defmodule ProjectEuler do
  def pe018() do
    a = [
      [63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
      [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
      [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
      [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
      [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
      [41, 41, 26, 56, 83, 40, 80, 70, 33],
      [99, 65, 04, 28, 06, 16, 70, 92],
      [88, 02, 77, 73, 07, 63, 67],
      [19, 01, 23, 75, 03, 34],
      [20, 04, 82, 47, 65],
      [18, 35, 87, 10],
      [17, 47, 82],
      [95, 64],
      [75]
    ]

    first_row = [04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23]

    sum_triangles(a, first_row)
  end

  defp sum_triangles([], maxv) do
    [head | _] = maxv
    head
  end

  defp sum_triangles(a, row) do
    [head | tail] = a
    max_vals = process_row(row, [])
    new_row = add_rows(head, max_vals, [])
    sum_triangles(tail, new_row)
  end

  defp add_rows([], [], list) do
    Enum.reverse(list)
  end

  defp add_rows(in_row1, in_row2, out) do
    [head1 | tail1] = in_row1
    [head2 | tail2] = in_row2
    add_rows(tail1, tail2, [head1 + head2 | out])
  end

  defp process_row([], list) do
    Enum.reverse(list)
  end

  defp process_row(input, out) do
    [head | tail] = input

    if length(tail) > 0 do
      new_out = [mymax(head, hd(tail)) | out]
      process_row(tail, new_out)
    else
      process_row([], out)
    end
  end

  def mymax(a, b) when a > b do
    a
  end

  def mymax(_, b) do
    b
  end
end

IO.puts(ProjectEuler.pe018())
