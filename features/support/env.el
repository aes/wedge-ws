;; Cribbed from
;; https://github.com/magnars/expand-region.el, /features/support/env.el

(let* ((current-directory (file-name-directory load-file-name))
       (features-directory (expand-file-name ".." current-directory))
       (project-directory (expand-file-name ".." features-directory)))
  (setq project-root-path project-directory))

(add-to-list 'load-path project-root-path)
(add-to-list 'load-path (concat project-root-path "elpa"))

(require 'wedge-ws)
(require 'espuds)
(package-initialize)

(Before
 (global-set-key (kbd "C-c :") 'wedge-ws-inc)
 (global-set-key (kbd "C-c ;") 'wedge-ws-dec)
 (switch-to-buffer
  (get-buffer-create "*wedge-ws*"))
 (erase-buffer)
 (fundamental-mode)
 (transient-mark-mode 1)
 (cua-mode 0)
 (setq set-mark-default-inactive nil)
 (deactivate-mark))

(After)
