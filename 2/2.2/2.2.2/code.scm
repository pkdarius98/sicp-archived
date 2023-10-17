(define x (cons (list 1 2) (list 3 4)))

(define (count_leaves tree)
    (cond ((null? tree) 0)
          ((not (pair? tree)) 1)
          (else (+ (count_leaves (car tree))
                   (count_leaves (cdr tree))))))

(length x)
(count_leaves x)

(list x x)
(length (list x x))
(count_leaves (list x x))

(define (scale_tree tree factor)
    (cond ((null? tree) '())
          ((not (pair? tree)) (* tree factor))
          (else (cons (scale_tree (car tree) factor)
                      (scale_tree (cdr tree) factor)))))
(scale_tree '(1 (2 (3 4) 5) (6 7)) 10)

(define (scale_tree tree factor)
    (map (lambda (sub_tree)
            (if (pair? sub_tree)
                (scale_tree sub_tree factor)
                (* sub_tree factor)))
         tree))
(scale_tree '(1 (2 (3 4) 5) (6 7)) 10)
