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

            ;; redefine
            (local-set-key (kbd "C-c b o")   'prelude-google)
            (local-set-key (kbd "C-c b g")   'prelude-github)
            (local-set-key (kbd "C-c b y")   'prelude-youtube)
            (local-set-key (kbd "C-c b d")   'prelude-duckduckgo)
            (local-set-key (kbd "C-c v u")   'prelude-view-url)
            (local-set-key (kbd "C-c v t")   'prelude-visit-term-buffer)
            (local-set-key (kbd "C-c w s")   'prelude-swap-windows)
            (local-set-key (kbd "C-c r D")   'prelude-delete-file-and-buffer)
            (local-set-key (kbd "C-c r M-d") 'prelude-duplicate-and-comment-current-line-or-region)
            (local-set-key (kbd "C-c r d")   'prelude-duplicate-current-line-or-region)
            (local-set-key (kbd "C-c r R")   'prelude-rename-file-and-buffer)
            (local-set-key (kbd "C-c r K")   'prelude-kill-other-buffers)
            (local-set-key (kbd "C-c r j")   'prelude-top-join-line)
            (local-set-key (kbd "C-c r k")   'prelude-kill-whole-line)
            (local-set-key (kbd "C-c m g")   'magit-status)
            (local-set-key (kbd "C-c m l")   'magit-log)
            (local-set-key (kbd "C-c m f")   'magit-file-log)
            (local-set-key (kbd "C-c m B")   'magit-blame-mode)))

;;; prelude-pack.el ends here
