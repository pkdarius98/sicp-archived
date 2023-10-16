(define (repeated f n)
    (lambda (x) 
        (define (iter result count)
            (if (= count n)
                result
                (iter (f result) (+ count 1))))
        (iter x 0)))

(define dx 0.000001)
(define (smooth f)
    (lambda (x)
        (/ (+ (f (- x dx))
              (f x)
              (f (+ x dx)))
           3)))

(define (smooth_n_fold f n)
    ((repeated smooth n) f))