#set page(paper: "us-letter")
#set document(
  title: "Homework 2",
  author: "Uzair Hamed Mohammed",
  date: auto
)
#set par(justify: true)

#align(center)[
  #title() \
  Uzair Hamed Mohammed \
  CSC 510, Spring 2026 \
  Due 3/9
]

#set enum(numbering: "1.a.i.")

+ Consider the following recursive algorithm:

  ```
  OverlapSort(A[1, ..., n]):
    if n = 2
      if A[1] > A[2]
        swap A[1] and A[2]
      else if n > 2
        OverlapSort(A[2, ..., n])
        OverlapSort(A[1, ..., n - 1])
        OverlapSort(A[2, ..., n])
  ```

  Prove by induction that this algorithm correctly sorts all arrays of length $n >= 0$

  We prove by strong induction on $n$. For $n=0,1$ the array is trivially sorted. For $n=2$, the algorithm swaps if needed, so it sorts. Assume $n>2$ and that the algorithm sorts all arrays of smaller size.

  #underline[Sol]: Let $A$ be an array of length $n$. After the first call `OverlapSort(A[2..n])`, we have $A[2] < ... < A[n]$. After the second call `OverlapSort(A[1..n-1])`, we have $A[1] < ... < A[n-1]$, and $A[n]$ is unchanged and satisfies $A[n] > A[i]$ for all $i=2, ...,n-1$ (since it was the maximum of that subarray). Thus $A[1] < A[2] < ... < A[n-1]$ and $A[2] < A[n]$, so $A[1] < A[i]$ for all $i=2, ...,n$. The third call sorts $A[2..n]$, yielding $A[2] < ... < A[n]$ and $A[1] < A[2]$. Hence the whole array is sorted. ∎

+ Use the method of recursion trees to solve the following recurrences:
  + $A(n) = 3A(n/9) + Theta (sqrt(n))$
  + $B(n) = 4B(n/3) + Theta (n^2)$

  For each recursion tree, draw three layers (root, children , grandchildren) of the recursion tree. If you don't want to draw, describe the trees ("there are four children, each with label $n^2/4$"). Afterwards, analyze the recursion tree to solve for the runtime of $A(n)$ and $B(n)$. Double-check your answers using the master theorem.

  #underline[Sol]:

  
  We solve using recursion trees.

  For $A(n) = 3A(n/9) + Theta(sqrt(n))$:
  Root cost $Theta(sqrt(n))$. It has 3 children, each of size $n/9$, cost $Theta(sqrt(n/9)) = Theta(sqrt(n)/3)$. Each child has 3 grandchildren of size $n/81$, cost $Theta(sqrt(n/81)) = Theta(sqrt(n)/9)$. Total cost at level 0: $Theta(sqrt(n))$, level 1: $3 ... Theta(sqrt(n)/3) = Theta(sqrt(n))$, level 2: $9 ... Theta(sqrt(n)/9) = Theta(sqrt(n))$. All levels contribute the same $Theta(sqrt(n))$. Number of levels $= log_9 n$, so $A(n) = Theta(sqrt(n) log n)$.
  Master theorem: $a=3$, $b=9$, $f(n)=Theta(sqrt(n))$, $n^{log_b a} = n^{log_9 3}= n^{1/2}$, case 2 gives $Theta(n^{1/2} log n)$.

  For $B(n) = 4B(n/3) + Theta(n^2)$:
  Root cost $Theta(n^2)$. Four children, each size $n/3$, cost $Theta((n/3)^2) = Theta(n^2/9)$. Sixteen grandchildren, each size $n/9$, cost $Theta((n/9)^2) = Theta(n^2/81)$. Total cost per level: level 0 $Theta(n^2)$, level 1 $4 ... Theta(n^2/9) = Theta((4/9)n^2)$, level 2 $16 ... Theta(n^2/81) = Theta((4/9)^2 n^2)$. This geometric series with ratio $4/9 < 1$ sums to $Theta(n^2)$. So $B(n) = Theta(n^2)$.
  Master theorem: $a=4$, $b=3$, $f(n)=Theta(n^2)$, $n^{log_3 4} approx n^{1.261} < n^2$, case 3 with regularity $4f(n/3) = 4(n/3)^2 = (4/9)n^2 < c n^2$ for $c=4/9<1$, so $B(n) = Theta(n^2)$.

+ Hindsight is 20/20 when it comes to investing in rare Pokemon cards. Suppose you’re given an array $P[1, ..., n]$, where $P[i]$ is the price of a certain card on day $i$. The goal is to find the best days to buy and sell in order to maximize your profit. The return value of your algorithms should be the profit made, i.e., the difference between the selling price and the buying price.

  You may assume that you’re only buying and selling one card, the price doesn’t change during a given day, and that the card needs to be bought before it is sold. In other words, you are trying to maximize $P[j] - P[i]$ over all pairs of indices $i$ and $j$, where $i <= j$. For example, if the array of prices is

  $
    [2, 4, 3, 5, 1],
  $

  The maximum profit is 3, which is achieved when you buy on day 1 and sell on day 4. You can't make a profit of 4 because 1 comes after 5.

  For both parts below, write down an algorithm in pseudocode.

    + Design a brute force algorithm for solving this problem. The algorithm should be of the form:

      ```
      CardBrute(P[1, ..., n]):
        // code here
      ```

      In big-O notation, what is the runtime of your algorithm?

    + Use divide and conquer to design an algorithm that runs in time $Theta (n log n)$. The algorithm should be of the form:

      ```
      CardDnC(P[1, ..., n]):
        // code here
      ```

      Give a brief explanation for why this algorithm works, and why it runs in time $Theta (n log n)$. (Yes, there is a faster way of doing this problem.)

      + Brute force algorithm:
  ```
  CardBrute(P[1..n]):
      max_profit = 0
      for i = 1 to n:
          for j = i to n:
              profit = P[j] - P[i]
              if profit > max_profit:
                  max_profit = profit
      return max_profit
  ```
  Runtime: $O(n^2)$.

  + Divide‑and‑conquer algorithm (running in $Theta(n log n)$):
    ```
    CardDnC(P[1..n], l, r):
        if l == r:
            return 0
        mid = floor((l + r)/2)
        left_profit = CardDnC(P, l, mid)
        right_profit = CardDnC(P, mid+1, r)

        // find minimum in left half
        min_left = P[l]
        for i = l+1 to mid:
            if P[i] < min_left:
                min_left = P[i]

        // find maximum in right half
        max_right = P[mid+1]
        for i = mid+2 to r:
            if P[i] > max_right:
                max_right = P[i]

        cross_profit = max_right - min_left
        return max(left_profit, right_profit, cross_profit)
    ```
  Initial call: `CardDnC(P, 1, n)`.  
  Explanation: The maximum profit is either entirely in the left half, entirely in the right half, or crossing the middle (buy in left, sell in right). The crossing profit is simply the maximum price in the right half minus the minimum price in the left half. Computing these two values by scanning the halves costs $Theta(n)$ at each level of recursion, leading to the recurrence $T(n) = 2T(n/2) + Theta(n)$, which solves to $Theta(n log n)$.

+ Use Karatsuba's algorithm (the algorithm with three recursive calls, not four) to multiply 8-digit numbers

$
  70542567 times 23224536
$

  You can just state the answers for any recursive call (i.e., any time you multiply two 4-digit numbers) instead of following the recursion all the way down to the base cases. However, if you were to trace every recursive call all the way, how many 1-digit multiplications would the algorithm have performed? How many 1-digit multiplications would regular “elementary school” multiplication use?

  Let $x = 70542567$, $y = 23224536$. Split into 4‑digit halves:
  $x_1 = 7054$, $x_0 = 2567$, $y_1 = 2322$, $y_0 = 4536$.
  Compute the three products:
  $
    p_1 = x_1 y_1 = 7054 * 2322 = 16,379,388,\
    p_2 = x_0 y_0 = 2567 * 4536 = 11,643,912,\
    p_3 = (x_1 + x_0)(y_1 + y_0) = 9621 * 6858 = 65,980,818.
  $
  Then the final product is
  $
    p_1 10^8 + (p_3 - p_1 - p_2) 10^4 + p_2 = 1,638,318,386,823,912.
  $

  If every recursive call were expanded down to 1‑digit multiplications, Karatsuba’s algorithm would perform $3^(log_2 8) = 3^3 = 27$ single‑digit multiplications. The elementary‑school algorithm would use $8^2 = 64$ single‑digit multiplications.
