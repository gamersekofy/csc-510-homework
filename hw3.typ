#set page(paper: "us-letter")
#set document(
  title: "Homework 3",
  author: "Uzair Hamed Mohammed",
  date: auto
)
#set par(justify: true)

#align(center)[
  #title() \
  Uzair Hamed Mohammed \
  CSC 510, Spring 2026 \
  Due 3/20
]

#set enum(numbering: "1.a.i.")

+ The video game Tetris is played with seven different pieces that consist of four connected squares. For this problem, we consider three of those pieces: J, L, and O. Suppose you have a 2 ×n grid that you want to tile (every cell in the grid is covered, no pieces overlapping) with these pieces. Like in Tetris, you may rotate pieces, but you cannot flip any over. There are 5 ways of tiling the $2 × 6$ grid. Design a backtracking algorithm for computing the number of ways of tiling a $2 × n$ grid with these pieces, for any integer $n >= 1$ (or $n >= 0$, if you’d like). Your algorithm should be a pure, integer-valued function of the form:

  ```
  Tetris(n):
    // code here
  ```

+ At Cafe Verde, coffee costs 4 dollars and a sandwich costs 9 dollars. You want to spend exactly n dollars at Cafe Verde. If n = 11, this would not be possible. However, if you had n = 17 dollars, then you could buy two coffees and a sandwich. Design a backtracking algorithm for determining whether it is possible to spend exactly n dollars, for $n >= 1$ (or $n >= 0$, if you prefer). Your algorithm should be a pure, Boolean-valued function of the form:

  ```
  Cafe(n):
    // code here
  ```

+ In class, we saw a backtracking algorithm for solving the Subset Sum problem:

  ```
  SubsetSum(S[1, ..., n], i, t):
    if t = 0:
      return TRUE
    else if t < 0 or i = 0
      return FALSE
    else
      e := S[i]
      include := SubsetSum(S, i - 1, t - e)
      exclude := SubsetSum(S, i - 1, t)
      return include or exclude
  ```

  By only modifying the highlighted parts (and changing the function name), design a backtracking algorithm for the following variation: find the size of the largest subset that adds up to T. If there is no solution, then return −∞. Your algorithm should be a pure, integer-valued function of the form:
