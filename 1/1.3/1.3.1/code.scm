(define (sum_integers a b)
    (if (> a b)
        0
        (+ a (sum_integer (+ a 1) b))))

(define (sum_cubes a b)
    (if (> a b)
        0
        (+ (cube a) (sum_cubes (+ a 1) b))))

(define (pi_sum a  b)
    (if (> a b)
        0
        (+  (/ 1.0 (* a (+ a 2))) 
            (pi_sum (+ a 4) b))))

(define (sum term a next b)
    (if (> a b)
        0
        (+  (term a)
            (sum term (next a) next b))))

(define (inc n) (+ n 1))
(define (sum_cubes a b)
    (sum cube a inc b))
(sum_cubes 1 10)

(define (identity x) x)
(define (sum_integers a b)
    (sum identity a inc b))
(sum_integers 1 10)

(define (pi_sum a b)
    (define (pi_term x)
        (/ 1.0 (* x (+ x 2))))
    (define (pi_next x)
        (+ x 4))
    (sum pi_term a pi_next b))
(* 8 (pi_sum 1 5000))

(define (integral f a b dx)
    (define (add_dx x) (+ x dx))
    (* (sum f (+ a (/ dx 2.0)) add_dx b) dx))
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
(integral cube 0 1 0.0001)