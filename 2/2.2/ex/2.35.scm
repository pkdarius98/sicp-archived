(define (count_leaves tree)
    (accumulate 
        (lambda (x y) (+ x y))
        0
        (map (lambda (x) 1) (enumerate_tree tree))))
(count_leaves (list 1 (list 2 (list 3 4)) 5))