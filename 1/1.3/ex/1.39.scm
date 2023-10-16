(define (cont_frac n d k)
    (if (= k 0)
        0
        (/ (n k) (+ (d k) (cont_frac n d (- k 1))))))
(define (tan_cf x k)
    (cont_frac  (lambda (i) 
                    (if (= i 0)
                        1
                        (- (* x x))))
                (lambda (i)
                    (- (* 2 i) 1))
                k))

(tan_cf 3.1415926535897932384626433832795 100)
(tan 3.14)