(define (sum term a next b)
    (if (> a b)
        0
        (+  (term a)
            (sum term (next a) next b))))


(define (simpson f a b n)
    (define h (/ (- b a) n))
    (define (simpson_term x)
        (+  (f x)
            (* 4 (f (+ x h)))
            (f (+ x (* 2 h)))))
    (define (simpson_next x)
        (+ x (* 2 h)))
    (* (/ h 3) (sum simpson_term 0 simpson_next 1)))
(simpson cube 0.0 1.0 1000)