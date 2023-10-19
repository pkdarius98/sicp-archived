(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence) (accumulate op initial (cdr sequence)))))
(define (accumulate_n op init seqs)
    (if (null? (car seqs))
        '()
        (cons (accumulate op init (map (lambda (x) (car x)) seqs))
              (accumulate_n op init (map (lambda (x) (cdr x)) seqs)))))
(define (dot_product v w)
    (accumulate + 0 (map * v w)))
(define a '(3 4))
(define b '(1 2))
(map * a b)
(dot_product a b)

(define (matrix_multiply_vector m v)
    (map (lambda (x) (dot_product v x)) m))
(matrix_multiply_vector '((1 -1 2) (0 -3 1)) '(2 1 0))

(define (transpose mat)
    (accumulate_n (lambda (x y) (cons x y)) '() mat))
(transpose '((1 -1 2) (0 -3 1)))

(define (matrix_multiply_matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (x) (matrix_multiply_vector cols x)) m)))
(matrix_multiply_matrix '((0 4 -2) (-4 -3 0)) '((0 1) (1 -1) (2 3)))