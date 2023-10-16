(define (sub_interval x y)
    (make_interval  (- (upper_bound x) (lower_bound y))
                    (- (lower_bound x) (upper_bound y))))