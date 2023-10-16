(define (expt b n)
    (if (= n 0)
        1
        (* b (expt b (- n 1)))))

(expt 3 1000)
(define (expt b n)
    (define (expt_iter b counter product)
        (if (= counter 0)
            product
            (expt_iter  b
                        (- counter 1)
                        (* b product))))
    (expt_iter b n 1))

(expt 3 1000)

(define (fast_expt b n)
    (define (even? n)
        (= (remainder n 2) 0))
    (cond   ((= n 0) 1)
            ((even? n) (square (fast_expt b (/ n 2))))
            (else (* b (fast_expt b (- n 1))))))

(fast_expt 3 1000)