(setq wgrep-enable-key "q")
(mv-shell-mode 1)
(add-hook 'shell-mode-hook 'gdb-shell-minor-mode)
(paren-activate)
(add-hook 'prog-mode-hook 'highlight-parentheses-mode)
(eval-after-load 'init-finished
  '(progn
     (setq save-visited-files-auto-restore t)
     (save-visited-files-mode t)))
