(define (sqrt x)
  (define (good_enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
    (define (average x y)
        (/ (+ x y) 2))
    (average guess (/ x guess)))
  (define (sqrt_iter guess x)
    (if (good_enough? guess x)
        guess
        (sqrt_iter (improve guess x) x)))
  (sqrt_iter 1.0 x))
(sqrt 3) 