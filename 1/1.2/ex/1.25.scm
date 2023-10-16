(define (expmod base exp m)
  (remainder (fast_expt base exp) m))
(define (fast_expt a b)
    (define (even? n)
        (= (remainder n 2) 0))
    (define (fast_expt_iter product base n)
        (cond   
            ((= n 0) product)
            ((even? n) (fast_expt_iter product (* base base) (/ n 2)))
            (else (fast_expt_iter (* product base) base (- n 1)))))
    (fast_expt_iter 1 a b))
;; compare with

(define (expmod base exp m)
    (cond
        ((= exp 0) 1)
        ((even? exp) 
            (remainder 
                (square (expmod base (/ exp 2) m))
                m))
        (else 
            (remainder 
                (* base (expmod base (- exp 1) m))
                m))))