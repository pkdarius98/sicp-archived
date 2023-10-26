
(define (last_pair x)
    (if (null? (cdr x))
        x
        (last_pair (cdr x))))
(define (make_cycle x)
    (set-cdr! (last_pair x) x)
    x)
(define z (make_cycle (list 'a 'b 'c)))
z
(last_pair z)