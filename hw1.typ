#set page(paper: "us-letter")
#set document(
  title: "Homework 1",
  author: "Uzair Hamed Mohammed",
  date: auto
)
#set par(justify: true)

#align(center)[
  #title() \
  Uzair Hamed Mohammed \
  CSC 510, Spring 2026 \
  Due 2/23
]

#set enum(numbering: "1.a.i.")

+ The formal definition of big-O notation states that $f(n) in O(g(n))$ if there are real-valued constants $C, K > 0$ such that for all $n >= K, f(n) <= C g(n)$. Using the methods from class, show that...
  + #underline()[Sol]: Given $f(x)$, $g(x)$, and $C = 3$, we get
  $
    2x^3 + 20x^2 -89x - 110 <= 3x^2 => x^3 - 20x^2 + 89x + 110 >= 0
  $

  after factoring, we get

  $
    x^3 - 20x^2 + 89x + 110 = (x - 10)(x - 11)(x + 1).
  $

  Therefore, the roots are $x = -1, 10, 11$. Since all factors are nonnegative $forall x >= 11$, the inequality holds. So, the smallest value of $K$ we can choose is #highlight[11].

  + Given $17x^5 - 5x^4 + 14x^3 -9x^2 + 3x + 10 <= C x^5$, we can rewrite it as:
  $
    f(x) / x^5 = 17 - 5 / x + 14 / x^2 - 9 / x^3 + 3 / x^4 + 10 / x^5.
  $

  For $x >= 1$, the equation is decreasing, so the max occurs at $x = 1 (f(1) / 1^5 = 17 - 5 + 14 - 9 + 3 + 10 = 30)$. So, $forall x >= 1$:
  $
    f(x) / x^5 <= 30 => f(x) 30x^5.
  $

  Therefore, I got #highlight[30] as the value of $C$.

+ Prove by induction of the fact $limits(lim)_(x -> oo) (ln x)^n / x =0, forall n >= 0$

#pagebreak()
#set enum(numbering: "1.a.i.")

+ Convert Java method to pseudocode

```
BINARYSEARCH(A[1..n], target):
    low := 1
    high := n
    while low ≤ high
        mid := floor((low + high) / 2)
        if A[mid] = target then
            return mid
        else if A[mid] < target then
            low := mid + 1
        else
            high := mid - 1
    return -1
```

+ Algorithm analysis

ALG1(n):

(i) $a: O(n), b: O(n), c: O(n), d: O(n), e: O(n^4)$, while: $O(log n)$  
(ii) $O(n) * O(n) * [ O(n^2) + O(n^4 log n) ]$
(iii) $O(n) * O(n) * [ O(n^2) + O(n^4 log n) ] = O(n^2) * O(n^4 log n) = O(n^6 log n)$

ALG2(m, n):  
(i) Subroutine  $O(m^6 log m); a: O(n); b: O(log m);$ first while: $O(m);$ second while: $O(log m); e: O(n); f: O(m^2); g: O(1)$

(ii) $O(n) * [ O(log m) * ( O(m) + O(log m) + O(m^6 log m) ) + O(n) * O(m^2) * O(1) ]$  

(iii) Simplify to $O(n m^6 (log m)^2 + n^2 m^2)$
