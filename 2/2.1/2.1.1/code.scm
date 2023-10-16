(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make_rat n d)
    (let ((g ((if (< d 0) - +) (gcd n d))))
         (cons (/ n g) (/ d g))))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add_rat x y)
  (make_rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub_rat x y)
  (make_rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul_rat x y)
  (make_rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div_rat x y)
  (make_rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal_rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (print_rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x)))

(define one_half (make_rat -1 2))
(print_rat one_half)

(define one_third (make_rat 1 3))
(print_rat one_third)

(print_rat (add_rat one_half one_third))

(print_rat (mul_rat one_half one_third))

(print_rat (add_rat one_third one_third))