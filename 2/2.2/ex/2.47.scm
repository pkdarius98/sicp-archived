;; frame implementation 1
(define (make_frame origin edge1 edge2)
    (list origin edge1 edge2))

(define (origin_frame frame)
    (car frame))

(define (edge1_frame frame)
    (car (cdr frame)))

(define (edge2_frame frame)
    (car (cdr (cdr frame))))

;; frame implementation 2
(define (make_frame origin edge1 edge2)
    (cons origin (cons edge1 edge2)))

(define (origin_frame frame)
    (car frame))

(define (edge1_frame frame)
    (car (cdr frame)))

(define (edge2_frame frame)
    (cdr (cdr frame)))