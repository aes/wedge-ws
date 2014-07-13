

(When "^I wedge$"
  (lambda ()
    (wedge-ws-inc)))

(When "^I unwedge$"
  (lambda ()
    (wedge-ws-dec)))

(When "^I wedge in \\(.+\\)$"
  (lambda (wedge)
    (wedge-ws wedge)))

(Then "^I should see precisely\\(?: \"\\(.+\\)\"\\|:\\)$"
  "Asserts that the current buffer matches some text precisely."
  (lambda (expected)
    (let ((actual (buffer-string))
          (message "Expected to see precisely '%s' in '%s', but did not."))
      (cl-assert
       (string= expected actual) nil message expected actual))))

(Then "^I should not see precisely\\(?: \"\\(.+\\)\"\\|:\\)$"
  "Asserts that the current buffer matches some text precisely."
  (lambda (expected)
    (let ((actual (buffer-string))
          (message "Expected to not see precisely '%s', but did."))
      (cl-assert
       (not (string= expected actual)) nil message expected actual))))
