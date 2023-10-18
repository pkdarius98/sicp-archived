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

(define (square x)
    (* x x))
(define (sum_odd_squares tree)
    (accumulate + 0 (map square (filter odd? (enumerate_tree tree)))))
(sum_odd_squares (list 1 (list 2 (list 3 4)) 5))

(define (fib n)
  (fib_iter 1 0 0 1 n))
(define (fib_iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib_iter a
                   b
                   (+ (* q q) (* p p))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
        (else (fib_iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
(define (even_fibs n)
    (accumulate cons '() (filter even? (map fib (enumerate_interval 0 n)))))
(even_fibs 10)

(define (list_fib_squares n)
    (accumulate cons '() (map square (map fib (enumerate_interval 0 n)))))
(list_fib_squares 10)

(define (product_of_squares_of_odd_elements sequence)
    (accumulate * 1 (map square (filter odd? sequence))))
(product_of_squares_of_odd_elements (list 1 2 3 4 5))

; (define (salary_of_highest_paid_programmer records)
;     (accumulate max 0 (map salary (filter programmer? records))))

