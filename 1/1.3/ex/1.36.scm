(define tolerance 0.00001)
(define (close_enough? x y)
    (< (abs (- x y)) tolerance))
(define (fixed_point f first_guess)
    (define (try guess)
        (display guess)(newline)
        (let ((next (f guess)))
            (if (close_enough? guess next)
                next
                (try next))))
    (try first_guess))
(fixed_point (lambda (x) (/ (log 1000) (log x))) 10.0) ;; 32 step

(fixed_point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 10.0) ;; 8 step
