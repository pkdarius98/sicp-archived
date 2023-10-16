(define (average x y)
    (/ (+ x y) 2))
(define (average_damp f)
    (lambda (x) (average x (f x))))
((average_damp square) 10)

(define tolerance 0.0000000000001)
(define (close_enough? x y)
    (< (abs (- x y)) tolerance))

(define (fixed_point f first_guess)
    (define (try guess)
        (let ((next (f guess)))
            (if (close_enough? guess next)
                next
                (try next))))
    (try first_guess))
(define (sqrt x)
    (fixed_point (average_damp (lambda (y) (/ x y))) 1.0))
(sqrt 3)

(define (cube_root x)
    (fixed_point (average_damp (lambda (y) (/ x (square y)))) 1.0))
(cube_root 27)

(define dx 0.0000001)
(define (deriv g)
    (lambda (x)
        (/ (- (g (+ x dx)) (g x)) dx)))
(define (cube x) (* x x x))
((deriv cube) 5)

(define (newton_transform g)
    (lambda (x)
        (- x (/ (g x) ((deriv g) x)))))
(define (newtons_method g guess)
    (fixed_point (newton_transform g) guess))
(define (sqrt x)
    (newtons_method (lambda (y) (- (square y) x)) 1.0))
(sqrt 3)

(define (fixed_point_of_transform g transform guess)
    (fixed_point (transform g) guess))

(define (sqrt x)
    (fixed_point_of_transform   (lambda (y) (/ x y))
                                average_damp
                                1.0))
(sqrt 2)


(define (sqrt x)
    (fixed_point_of_transform   (lambda (y) (- (square y) x))
                                newton_transform
                                1.0))
(sqrt 2)
