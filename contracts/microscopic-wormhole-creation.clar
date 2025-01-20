;; Microscopic Wormhole Creation Contract

(define-data-var wormhole-counter uint u0)

(define-map microscopic-wormholes uint {
    location: (string-ascii 50),
    size: uint,
    stability-duration: uint,
    energy-consumption: uint,
    creator: principal
})

(define-public (create-wormhole (location (string-ascii 50)) (size uint) (stability-duration uint) (energy-consumption uint))
    (let
        ((new-id (+ (var-get wormhole-counter) u1)))
        (map-set microscopic-wormholes new-id {
            location: location,
            size: size,
            stability-duration: stability-duration,
            energy-consumption: energy-consumption,
            creator: tx-sender
        })
        (var-set wormhole-counter new-id)
        (ok new-id)
    )
)

(define-read-only (get-wormhole (id uint))
    (map-get? microscopic-wormholes id)
)

(define-read-only (get-wormhole-count)
    (var-get wormhole-counter)
)

