;; Spacetime Curvature Experiments Contract

(define-data-var experiment-counter uint u0)

(define-map curvature-experiments uint {
    location: (string-ascii 50),
    curvature-value: int,
    energy-input: uint,
    result: (string-utf8 500),
    experimenter: principal
})

(define-public (conduct-experiment (location (string-ascii 50)) (curvature-value int) (energy-input uint) (result (string-utf8 500)))
    (let
        ((new-id (+ (var-get experiment-counter) u1)))
        (map-set curvature-experiments new-id {
            location: location,
            curvature-value: curvature-value,
            energy-input: energy-input,
            result: result,
            experimenter: tx-sender
        })
        (var-set experiment-counter new-id)
        (ok new-id)
    )
)

(define-read-only (get-experiment (id uint))
    (map-get? curvature-experiments id)
)

(define-read-only (get-experiment-count)
    (var-get experiment-counter)
)

