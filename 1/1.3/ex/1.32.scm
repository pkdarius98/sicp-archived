(define (accumulate combiner null_value term a next b)
    (if (> a b)
        null_value
        (combiner (term a) (accumulate combiner null_value term (next a) next b))))
(define (identity x) x)
(define (inc x) (+ x 1))

(define (sum_integers a b)
    (accumulate + 0 identity a inc b))
(sum_integers 1 10)

(define (accumulate combiner null_value term a next b)
    (define (iter result a)
        (if (> a b)
            result
            (iter (combiner a result) (next a))))
    (iter null_value a))

(define (factorial n)
    (accumulate * 1 identity 1 inc n))
(factorial 10)