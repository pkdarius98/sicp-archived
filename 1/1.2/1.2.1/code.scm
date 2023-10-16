(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))
(factorial 10)

(define (factorial n)
  (fact_iter 1 1 n))

(define (fact_iter product counter max_count)
  (if (> counter max_count)
      product
      (fact_iter (* counter product)
                 (+ counter 1)
                 max_count)))
(factorial 10)