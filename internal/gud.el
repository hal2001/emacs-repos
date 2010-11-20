(require 'gud)
(define-key gud-minor-mode-map (kbd "M-v") 'gdb-toggle-breakpoint)
(define-key gud-minor-mode-map (kbd "M-c") 'gud-cont   )
(define-key gud-minor-mode-map (kbd "M-m") 'gud-down   )
(define-key gud-minor-mode-map (kbd "M-q") 'gud-finish )
(define-key gud-minor-mode-map (kbd "M-u") 'gud-next   )
(define-key gud-minor-mode-map (kbd "M-s") 'gud-step   )
(define-key gud-minor-mode-map (kbd "M-i") 'gud-until  )
(define-key gud-minor-mode-map (kbd "M-n") 'gud-up     )
(define-key gud-minor-mode-map (kbd "C-x C-<SPC>") 'gud-refresh)