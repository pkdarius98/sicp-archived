(define (sum term a next b)
    (if (> a b)
        0
        (+  (term a)
            (sum term (next a) next b))))
(define (pi_sum a b)
    (sum 
        (lambda (x) (/ 1.0 (* x (+ x 2))))
        a
        (lambda (x) (+ x 4))
        b))
(define (integral f a b dx)
    (*  (sum f
                (+ a (/ dx 2.0))
                (lambda (x) (+ x dx))
                b)
        dx))

((lambda (x y z) (+ x y (square z))) 1 2 3)

(define (f x y)
    (define (f_helper a b)
        (+  (* x (square a))
            (* y b)
            (* a b)))
    (f_helper   (+ 1 (* x y)) 
                (- 1 y)))

(define (f x y)
    (let ((a (+ 1 (* x y)))
         (b (- 1 y)))
        (+  (* x (square a))
            (* y b)
            (* a b))))