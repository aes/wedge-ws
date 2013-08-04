

(When "^I wedge$"
  (lambda ()
    (wedge-ws-inc)))

(When "^I unwedge$"
  (lambda ()
    (wedge-ws-dec)))

(When "^I wedge in \\(.+\\)$"
  (lambda (wedge)
    (wedge-ws wedge)))

