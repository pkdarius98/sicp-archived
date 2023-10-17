(define (square_tree tree)
    (cond ((null? tree) '())
          ((not (pair? tree)) (* tree tree))
          (else (cons (square_tree (car tree))
                      (square_tree (cdr tree))))))
(square_tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (square_tree tree)
    (map (lambda (sub_tree)
            (if (pair? sub_tree)
                (square_tree sub_tree)
                (* sub_tree sub_tree)))
         tree))
(square_tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
