(define x (list (list (list 1 2 3) (list 4 5 6)) (list (list 7 8 9) (list 10 11 12))))

(define (deep_reverse items)
    (if (pair? items)
        (append (deep_reverse (cdr items)) (list (deep_reverse (car items))))
        items))
(deep_reverse x)

