(define (a_plus_abs_b a b) ;; a + |b|
    ((if (> b 0) + -) a b)) 