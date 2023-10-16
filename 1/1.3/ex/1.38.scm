(define (div a b) (floor (/ a b)))
(define (cont_frac n d k z)
    (if (= k z)
        0
        (/ (n k) (+ (d k) (cont_frac n d (+ k 1) z)))))
(+ 2 (cont_frac 
            (lambda (i) 1.0)
            (lambda (i)
                (if (= (remainder i 3) 1)
                    (* 2 (+ 1 (div i 3)))
                    1))
            0 100))

