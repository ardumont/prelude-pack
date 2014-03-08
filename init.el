;;; prelude-pack.el --- Prelude's default binding

;;; Commentary:

;;; Code:

(require 'prelude-mode)

(add-hook 'prelude-mode-hook
          (lambda ()
            ;; unset
            (define-key prelude-mode-map (kbd "C-c s") nil)
            (define-key prelude-mode-map (kbd "C-c g") nil)
            (define-key prelude-mode-map (kbd "C-c G") nil)
            (define-key prelude-mode-map (kbd "C-c U") nil)
            (define-key prelude-mode-map (kbd "C-c e") nil)
            (define-key prelude-mode-map (kbd "C-c d") nil)
            (define-key prelude-mode-map (kbd "C-c M-d") nil)
            (define-key prelude-mode-map (kbd "C-c u") nil)
            (define-key prelude-mode-map (kbd "C-c y") nil)
            (define-key prelude-mode-map (kbd "C-c r") nil)

            ;; redefine
            (define-key prelude-mode-map (kbd "C-c b o")   'prelude-google)
            (define-key prelude-mode-map (kbd "C-c b g")   'prelude-github)
            (define-key prelude-mode-map (kbd "C-c b y")   'prelude-youtube)
            (define-key prelude-mode-map (kbd "C-c b d")   'prelude-duckduckgo)
            (define-key prelude-mode-map (kbd "C-c v u")   'prelude-view-url)
            (define-key prelude-mode-map (kbd "C-c v t")   'prelude-visit-term-buffer)
            (define-key prelude-mode-map (kbd "C-c w s")   'prelude-swap-windows)
            (define-key prelude-mode-map (kbd "C-c r D")   'prelude-delete-file-and-buffer)
            (define-key prelude-mode-map (kbd "C-c r M-d") 'prelude-duplicate-and-comment-current-line-or-region)
            (define-key prelude-mode-map (kbd "C-c r d")   'prelude-duplicate-current-line-or-region)
            (define-key prelude-mode-map (kbd "C-c r R")   'prelude-rename-file-and-buffer)
            (define-key prelude-mode-map (kbd "C-c r K")   'prelude-kill-other-buffers)
            (define-key prelude-mode-map (kbd "C-c r j")   'prelude-top-join-line)
            (define-key prelude-mode-map (kbd "C-c r k")   'prelude-kill-whole-line)
            (define-key prelude-mode-map (kbd "C-c m g")   'magit-status)
            (define-key prelude-mode-map (kbd "C-c m l")   'magit-log)
            (define-key prelude-mode-map (kbd "C-c m f")   'magit-file-log)
            (define-key prelude-mode-map (kbd "C-c m B")   'magit-blame-mode)))

;;; prelude-pack.el ends here
