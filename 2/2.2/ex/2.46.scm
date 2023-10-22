(define (make_vect x y)
    (cons x y))

(define (xcor_vect v)
    (car v))

(define (ycor_vect v)
    (cdr v))

(define (add_vect v1 v2)
    (make_vect (+ (xcor_vect v1) (xcor_vect v2))
               (+ (ycor_vect v1) (ycor_vect v2))))

(define (sub_vect v1 v2)
    (make_vect (- (xcor_vect v1) (xcor_vect v2))
               (- (ycor_vect v1) (ycor_vect v2))))

(define (scale_vect v n)
    (make_vect (* (xcor_vect v) n)
               (* (ycor_vect v) n)))   