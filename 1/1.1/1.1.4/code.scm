(define (square x) (* x x))
(square 21)
(square (+ 2 5))
(square (square 3))

(define (sum_of_squares x y)
  (+ (square x) (square y)))
(sum_of_squares 3 4)

(define (f a)
  (sum_of_squares (+ a 1) (* a 2)))

(f 5)