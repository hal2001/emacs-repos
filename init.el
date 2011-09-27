(require 'log-edit)
(setq warning-suppress-types nil)
;;Create required directories
(mapcar (lambda (dir) (mkdir dir t))
        '("~/.emacs.d/tmp"
          "~/.emacs.d/elisp"
          "~/.emacs.d/log"))

(let ((default-directory (concat emacs-repos-dir "supported/")))
  (add-to-list 'load-path default-directory)
  (normal-top-level-add-subdirs-to-load-path))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-current-time ((t (:inherit org-time-grid :foreground "red"))) t))
 
;;Loads emacs configuration
(load-file (concat emacs-repos-dir "customization/prog-util.el"))
(load-file (concat emacs-repos-dir "customization/org.el"))
(load-directory (concat emacs-repos-dir "internal/"))
(load-directory (concat emacs-repos-dir "external/"))

;;We're finished loading everything now
(provide 'init-finished)
(require 'tacc)

(add-to-list 'auto-mode-alist '("\\.tac$" . tacc-mode))

(defun sum-column()
  "Sums a column of numbers starting at point"
  (interactive)
  (save-excursion
    (if (and (not (= (current-column) 0))
             (re-search-backward "[ \t]" 0 t ))
        (forward-char))
    (let ((retn 0)
          (old-column (current-column))
          (old-next-line-add-newlines))
      (setq next-line-add-newlines nil)
      (while (not
              (looking-at "^[ \t]*$"))
        (move-to-column old-column t)
        (if (and (looking-at "-?[0123456789]+")
                 (eq (current-column) old-column))
            (setq retn (+ retn (string-to-number (current-word)))))
        (next-line)
        (beginning-of-line))
      (next-line)
      (next-line)
      (move-end-of-line 0)
      (insert (make-string (- old-column (current-column)) 32))
      (insert (number-to-string retn))
      (setq next-line-add-newlines old-next-line-add-newlines)
      retn)))

(if (get-buffer "scratch.el")
    (kill-buffer "scratch.el"))
