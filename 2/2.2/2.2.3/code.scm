(define (map proc sequence)
    (if (null? sequence)
        '()
        (cons (proc (car sequence))
              (map proc (cdr sequence)))))
              
(define (filter predicate sequence)
    (cond ((null? sequence) '())
          ((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
          (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence) (accumulate op initial (cdr sequence)))))
        
(define (enumerate_interval low high)
    (if (> low high)
        '()
        (cons low (enumerate_interval (+ low 1) high))))
(enumerate_interval 2 9)

(define (enumerate_tree tree)
    (cond ((null? tree) '())
          ((not (pair? tree)) (list tree))
          (else (append (enumerate_tree (car tree))
                        (enumerate_tree (cdr tree))))))
(enumerate_tree (list 1 (list 2 (list 3 4)) 5))
