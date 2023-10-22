(define (add_complex z1 z2)
    (make_from_real_imag
        (+ (real_part z1) (real_part z2))
        (+ (imag_part z1) (imag_part z2))))
(define (sub_complex z1 z2)
    (make_from_real_imag
        (- (real_part z1) (real_part z2))
        (- (imag_part z1) (imag_part z2))))
(define (mul_complex z1 z2)
    (make_from_mag_ang
        (* (magnitude z1) (magnitude z2))
        (+ (angle z1) (angle z2))))
(define (div_complex z1 z2)
    (make_from_mag_ang
        (/ (magnitude z1) (magnitude z2))
        (- (angle z1) (angle z2))))

(define (real_part z) (car z))
(define (imag_part z) (cdr z))

(define (magnitude z)
    (sqrt (+ (square (real_part z)))
             (square (imag_part z))))
(define (angle z)
    (atan (imag_part z) (real_part z)))
(define (make_from_real_imag x y)
    (cons x y))
(define (make_from_mag_ang x y)
    (cons (* r (cos a)) (* r (sin a))))


(define (real_part z)
    (* (magnitude z) (cos (angle z))))
(define (imag_part z)
    (* (magnitude z) (sin (angle z))))
(define (magnitude z) (car z))
(define (angle z) (cdr z))

(define (make_from_real_imag x y)
    (cons (sqrt (+ (square x) (square y)))
          (atan y x)))
(define (make_from_mag_ang r a)
    (cons r a))