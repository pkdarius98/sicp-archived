(define (append! x y)
    (set-cdr! (last_pair x) y)
    x)
(define (last_pair x)
    (if (null? (cdr x))
        x
        (last_pair (cdr x))))
(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
z
(cdr x)
(define z1 (append! x y))
z1
(cdr x)
