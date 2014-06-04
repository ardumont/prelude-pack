;;; prelude-pack.el --- Prelude-pack's default binding override

;;; Commentary:

;;; Code:

(require 'prelude-mode)

(add-hook 'prelude-mode-hook
          (lambda ()
            ;; unset
            (define-key prelude-mode-map (kbd "C-c o") nil)
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
            (define-key prelude-mode-map (kbd "C-c t") nil)
            (define-key prelude-mode-map (kbd "C-c f") nil)
            (define-key prelude-mode-map (kbd "C-c D") nil)
            (define-key prelude-mode-map (kbd "C-c I") nil)
            (define-key prelude-mode-map (kbd "C-c S") nil)

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
            (define-key prelude-mode-map (kbd "C-c m B")   'magit-blame-mode)
            (define-key prelude-mode-map (kbd "C-c r M-v") 'move-text-up)
            (define-key prelude-mode-map (kbd "C-c r v")   'move-text-down)
            (define-key prelude-mode-map (kbd "C-c f r")   'prelude-recentf-ido-find-file)
            (define-key prelude-mode-map (kbd "C-c f D")   'prelude-delete-file-and-buffer)
            (define-key prelude-mode-map (kbd "C-c f I")   'prelude-find-user-init-file)
            (define-key prelude-mode-map (kbd "C-c f x")   (lambda () (interactive) (find-file-other-window "~/.xmonad/xmonad.hs")))
            (define-key prelude-mode-map (kbd "C-c f s")   (lambda () (interactive) (find-file-other-window "~/.stumpwmrc")))
            (define-key prelude-mode-map (kbd "C-c f p")   (lambda () (interactive) (find-file-other-window "~/.prelude-packs/prelude-packs.el")))
            (define-key prelude-mode-map (kbd "C-c f S")   'prelude-find-shell-init-file)
            (define-key prelude-mode-map (kbd "C-M-q")     'prelude-indent-defun)))

(provide 'prelude-pack)
;;; prelude-pack.el ends here
