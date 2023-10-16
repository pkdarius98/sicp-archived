(define (average x y)
    (/ (+ x y) 2))
(define (average_damp f)
    (lambda (x) (average x (f x))))

(define tolerance 0.0000000000001)
(define (close_enough? x y)
    (< (abs (- x y)) tolerance))

(define (fixed_point f first_guess)
    (define (try guess)
        (newline)(display guess)
        (let ((next (f guess)))
            (if (close_enough? guess next)
                next
                (try next))))
    (try first_guess))
    
(define (repeated f n)
    (lambda (x) 
        (define (iter result count)
            (if (= count n)
                result
                (iter (f result) (+ count 1))))
        (iter x 0)))

(define (power x n)
    (define (iter result count)
        (if (= count n)
            result
            (iter (* result x) (+ count 1))))
    (iter 1 0))

(define (damp_time power)
    (define (iter time counter)
        (if (> counter power)
            time
            (iter (+ time 1) (* counter 2))))
    (iter -1 1))

(define (nth_root n x)
    (fixed_point ((repeated average_damp (damp_time n)) (lambda (y) (/ x (power y (- n 1))))) 1.0))

(nth_root 2 10000)