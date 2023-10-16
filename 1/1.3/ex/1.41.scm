(define (inc x) (+ x 1))
(define (double f)
    (lambda (x) (f (f x))))
    
(((double (double double)) inc) 5)

;; (double double)
;; (lambda (x) (double (double x)))