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