(define (sqrt_iter guess x)
  (define next_guess (improve guess x))
  (if (good_enough? guess next_guess)
      next_guess
      (sqrt_iter next_guess x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good_enough? guess next_guess)
  (< (abs (- guess next_guess)) 1E_100))
(define (sqrt x)
  (sqrt_iter 1.0 x))


(sqrt 9E_50)