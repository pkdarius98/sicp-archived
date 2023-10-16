(define max_size 5)

(define (div a b)
    (define (div_iter c count)
        (if (<= c 1)
            count
            (div_iter (- c b ) (+ count 1))))
    (if (< a b)
        0
        (div_iter a 0)))
(define (rem a b)
    (- a (* (div a b) b)))

(define (length n)
    (define (length_iter remain count)
        (if (< remain 10)
            (+ count 1)
            (length_iter (div remain 10) (+ count 1))))
    (length_iter n 0))

(define (padding_for n)
    (define (padding_iter count)
        (if (< 0 count)
            (begin
                (display " ")
                (padding_iter (- count 1)))))
    (padding_iter (- max_size (length n))))

 (define (pascal r c)
     (cond
         ((or (> c r) (< r 0) (< c 0)) 0)
         ((or (= c 0) (= r 0)) 1)
         (else (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c)))))

(define (pascal_row m n)
    (define (space count)
        (if (< count (- n m))
            (begin
                (padding_for 0)
                (space (+ count 1)))))
    (define (pascal_iter count)
        (if (<= count m)
        (let ((p (pascal m count)))
                (padding_for p)
                (display p)
                (pascal_iter (+ count 1)))))
    (newline)
    (space 0)
    (pascal_iter 0))

(define (pascal_triangle n)
    (define (pascal_triangle_iter count)
        (if (< count n)
            (begin
                (pascal_row count n)
                (pascal_triangle_iter (+ count 1)))))
    (pascal_triangle_iter 0))
(pascal_triangle 12)