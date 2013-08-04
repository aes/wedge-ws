;;; wedge-ws.el --- Wedge in more whitespace in a river in the text

;; Copyright (C) 2013 Anders Eurenius <aes@spotify.com>

;; Author: Anders Eurenius <aes@spotify.com>
;; Created: 2013-08-04
;; Keywords: formatting indentation
;; Version: 0.1.0

;; This file is not part of GNU Emacs.

;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.


(defun ws-at-pos (&optional pos)
  (let ((p (or pos (point))))
    (eq 32 (char-syntax (aref (buffer-substring p (1+ p)) 0)))))

(defun goto-top-of-ws-col (&optional col)
  (let* ((col (or col (current-column)))
	 (beg (point)))
    (while (and (not (bobp)) (or (ws-at-pos) (> (current-column) col)))
      (setf beg (point))
      (forward-line -1)
      (if (not (bobp)) (move-to-column col)))
    (goto-char beg)))

(defun goto-bottom-of-ws-col (&optional col)
  (let* ((col (or col (current-column)))
	 (beg (point)))
    (while (and (not (bobp)) (or (ws-at-pos) (> (current-column) col)))
      (setf beg (point))
      (forward-line 1)
      (if (not (eobp)) (move-to-column col)))
    (goto-char beg)))

(defun wedge-ws (&optional insert)
  (save-excursion
    (let* ((origin (point))
	   (col (current-column))
	   (ins (or insert " ")))

      (when (not (ws-at-pos))
	(skip-chars-backward "^[:space:]")
	(if (> (current-column) 0) (backward-char 1))
	(setf col (current-column)))

      (goto-top-of-ws-col)

      (while (and (not (eobp)) (or (ws-at-pos) (> (current-column) col)))
	(setf beg (point))
	(if (= (current-column) col)
	    (if (numberp ins)
		(if (< ins 0)
		    (delete-char (- ins))
		  (insert (make-string ins " ")))
	      (insert ins)))
	(forward-line 1)
	(if (not (eobp)) (move-to-column col))) )))

(defun wedge-ws-inc ()
  (interactive)
  (wedge-ws " "))

(defun wedge-ws-dec ()
  (interactive)
  (wedge-ws -1))

(provide 'wedge-ws)

;;; wedge-ws.el ends here
