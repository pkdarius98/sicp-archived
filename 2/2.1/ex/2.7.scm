(define (make_interval a b)
    (cons a b))

(define (upper_bound a)
    (max (car a) (cdr a)))

(define (upper_bound a)
    (min (car a) (cdr a)))