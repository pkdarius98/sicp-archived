(define tolerance 0.00001)
(define (close_enough? x y)
    (< (abs (- x y)) tolerance))

(define (search f neg_point pos_point)
    
    (define (average x y)
        (/ (+ x y) 2))
    (let ((mid_point (average neg_point pos_point)))
        (if (close_enough? neg_point pos_point)
            mid_point
            (let ((test_value (f mid_point)))
                (cond
                    ((positive? test_value) (search f neg_point mid_point))
                    ((negative? test_value) (search f mid_point pos_point))
                    (else mid_point))))))
(define (half_interval_method f a b)
    (let ((a_value (f a))
          (b_value (f b)))
        (cond
            ((and (negative? a_value) (positive? b_value)) (search f a b))
            ((and (negative? b_value) (positive? a_value)) (search f b a))
            (else (error "Values are not of opposite sign" a b)))))
(half_interval_method sin 2.0 4.0)
(half_interval_method (lambda (x) (- (* x x x) (* 2 x) 3))
                      1.0
                      2.0)

(define (fixed_point f first_guess)
    (define (try guess)
        (let ((next (f guess)))
            (if (close_enough? guess next)
                next
                (try next))))
    (try first_guess))
(fixed_point cos 1.0)
(fixed_point (lambda (y) (+ (sin y) (cos y)))
             1.0)

(define (sqrt x)
    (fixed_point (lambda (y) (* (/ 1 2) (+ y (/ x y)))) 1.0))
(sqrt 2)