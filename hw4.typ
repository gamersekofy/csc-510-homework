#set page(paper: "us-letter")
#set document(
  title: "Homework 4",
  author: "Uzair Hamed Mohammed",
  date: auto,
)
#set par(justify: true)

#align(center)[
  #title() \
  Uzair Hamed Mohammed \
  CSC 510, Spring 2026 \
  Due 4/13
]

#set enum(numbering: "1.a.i.")

Each question is about designing a dynamic programming algorithm, based on your backtracking algorithm from the previous homework. First, state the recurrence or backtracking algorithm from the previous homework. Then, use it to write down a dynamic programming algorithm in pseudocode. Each algorithm must be purely iterative, with no recursive calls. Afterwards, analyze the runtime of your algorithm in big-O notation.

+ Tiling a $2 times n$ grid with J, L, and O pieces, where $n >= 1$ or $n >= 0$:

  #underline[Sol]: $ "Tetris"(n) = cases(
    1 & "if " n = 0,
    0 & "if " n < 0 "or" n "is odd",
    "Tetris"(n-2) + 2 dot "Tetris"(n-4) & "otherwise"
  ) $


  ```
  TetrisDP(n):
    if n < 0 or n % 2 == 1:
        return 0
    if n == 0:
        return 1
    m = n / 2
    dp = array of size m+1
    dp[0] = 1
    dp[1] = 1
    for i = 2 to m:
        dp[i] = dp[i-1] + 2 * dp[i-2]
    return dp[m]
  ```

  Runtime complexity: $O(n)$

+ Determining if you can spend exactly $n$ dollars at Cafe Verde.

  #underline[Sol]: $ "Cafe"(n) = cases(
    "true" & "if " n = 0,
    "false" & "if " n < 0,
    "Cafe"(n-4) "or" "Cafe"(n-9) & "otherwise"
  ) $

  ```
  CafeDP(n):
    if n < 0:
        return false
    dp = array of size n+1 of booleans
    dp[0] = true
    for i = 1 to n:
        dp[i] = false
        if i >= 4:
            dp[i] = dp[i] or dp[i-4]
        if i >= 9:
            dp[i] = dp[i] or dp[i-9]
    return dp[n]
  ```

  Runtime complexity: $O(n)$

+ Determining the size of the largest subset of $S$ that adds up to $T$ (if it exists).

  #underline[Sol]: $ "LargestSubset"(S, i, T) = cases(
    0 & "if " T = 0,
    -infinity & "if " T < 0 "or" i = 0,
    "max" ( "include", "exclude" ) & "otherwise"
  ) $
  $
    "where" quad "include" =
    cases(
      "LargestSubset"(S, i-1, T - S[i]) + 1 & "if that is not" -infinity,
      -infinity & "otherwise"
    )
  $
  $
    "and" quad "exclude" = "LargestSubset"(S, i-1, T)
  $

  ```
  LargestSubsetDP(S[1..n], T):
      let INF_NEG = -1000000  // represents -infinity
      create dp[0..n][0..T]  // dp[i][t] = max size using first i elements summing to t
      for t = 0 to T:
          dp[0][t] = INF_NEG
      dp[0][0] = 0

      for i = 1 to n:
          for t = 0 to T:
              // exclude S[i]
              dp[i][t] = dp[i-1][t]
              // include S[i] if possible
              if t >= S[i] and dp[i-1][t - S[i]] != INF_NEG:
                  candidate = dp[i-1][t - S[i]] + 1
                  if candidate > dp[i][t]:
                      dp[i][t] = candidate

      if dp[n][T] == INF_NEG:
          return -infinity
      else:
          return dp[n][T]
  ```

  Runtime complexity: $O(n dot T)$

+ Most coins a robot can collect in a grid $C$:

  #underline[Sol]: $
  "MostCoins"(C, i, j) = cases(
    0 &"if " i = 1 "and" j = 1,
    -infinity &"if " i < 1 "or" j < 1,
    "best" + (C[i][j] ? 1 : 0) &"otherwise"
  )
  $
  $
  "where" quad "best" = "max" ( "MostCoins"(C, i-1, j), " MostCoins"(C, i, j-1) )
  $

  ```
  MostCoinsDP(C[1..m][1..n]):
      create dp[1..m][1..n] of integers
      dp[1][1] = 0
      for j = 2 to n:
          dp[1][j] = dp[1][j-1] + (C[1][j] ? 1 : 0)
      for i = 2 to m:
          dp[i][1] = dp[i-1][1] + (C[i][1] ? 1 : 0)
      for i = 2 to m:
          for j = 2 to n:
              best = max(dp[i-1][j], dp[i][j-1])
              dp[i][j] = best + (C[i][j] ? 1 : 0)
      return dp[m][n]
  ```

  Runtime complexity: $O(m dot n)$
