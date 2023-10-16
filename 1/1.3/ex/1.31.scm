;; recursive
(define (product term a next b)
    (if (> a b)
        1
        (* (term a) (product term (next a) next b))))

(define (term x)
    (/ (* x (+ x 2)) (square (+ x 1))))
(define (next x) (+ x 2))
(product term 2 next 10)



(define (product term a next b)
    (define (iter product a)
        (if (> a b)
            product
            (iter (* product (term a)) (next a))))
    (iter 1 a))
(define (factorial n)
    (define (identity x) x)
    (define (inc x) (+ x 1))
    (product identity 1 inc n))
(factorial 10)