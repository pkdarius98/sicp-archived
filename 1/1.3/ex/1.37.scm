(define (cont_frac n d k)
    (if (= k 0)
        1
        (/ (n k) (+ (d k) (cont_frac n d (- k 1))))))
(/ 1 (cont_frac (lambda (i) 1.0) (lambda (i) 1.0) 100))

(define (cont_frac n d k)
    (define (iter result k)
        (if (= k 0)
            result
            (iter (/ (n k) (+ (d k) result)) (- k 1))))
    (iter 1 k))
(/ 1 (cont_frac (lambda (i) 1.0) (lambda (i) 1.0) 100))
