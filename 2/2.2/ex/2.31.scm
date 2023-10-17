(define (square x)
    (* x x))

(define (tree_map proc tree)
    (cond ((null? tree) '())
          ((not (pair? tree)) (proc tree))
          (else (cons (tree_map proc (car tree))
                      (tree_map proc (cdr tree))))))

(define (tree_map proc tree)
    (map (lambda (sub_tree)
            (if (pair? sub_tree))
                (tree_map proc sub_tree)
                (proc sub_tree))
         tree))

(define (square_tree tree)
    (tree_map square tree))
(square_tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
