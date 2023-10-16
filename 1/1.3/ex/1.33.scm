(define (filtered_accumulate combiner predicate null_value term a next b)
    (cond 
        ((> a b) null_value)
        ((predicate a) (combiner (term a) (filtered_accumulate combiner predicate null_value term (next a) next b)))
        (else (filtered_accumulate combiner predicate null_value term (next a) next b))))
(define (identity x) x)
(define (inc x) (+ x 1))

(define (sum_even_integers a b)
    (filtered_accumulate + even? 0 identity a inc b))
(sum_even_integers 1 10)

(define (filtered_accumulate combiner predicate null_value term a next b)
    (define (iter result a)
        (cond
            ((> a b) result)
            ((predicate a) (iter (combiner a result) (next a)))
            (else (iter result (next a)))))
    (iter null_value a))
(define (product_even_integers n)
    (filtered_accumulate * even? 1 identity 1 inc n))
(product_even_integers 10)