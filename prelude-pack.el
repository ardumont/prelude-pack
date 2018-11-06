;;; prelude-pack.el --- Prelude-pack's default binding override

;;; Commentary:

;;; Code:

(require 'crux)

(defun prelude-pack-log (&rest msg)
  "Log MSG."
  (apply 'message (format "Prelude-Pack - %s" (car msg)) (cdr msg)))

(defun prelude-pack--find-file-if-exists-or-log-not-found (file)
  "Open a FILE if found or do nothing but log."
  (if (file-exists-p file)
      (find-file file)
    (prelude-pack-log "%s not found, do nothing." file)))

(defun prelude-pack-open-xmonad-init-file! ()
  "Open xmonad's init file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found "~/.xmonad/xmonad.hs"))

(defun prelude-pack-open-stumpwm-init-file! ()
  "Open stumpwm's init file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found "~/.stumpwmrc"))

(defun prelude-pack-open-prelude-packs-file! ()
  "Open prelude-packs's init file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found "~/.prelude-packs/prelude-packs.el"))

(defun prelude-pack-open-global-todo-file! ()
  "Open the user's org todo file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found "~/org/todo.org"))

(defun prelude-pack-nixos-env-p ()
  "Predicate to determine if on nixos or not."
  (prelude-pack--find-file-if-exists-or-log-not-found "/etc/NIXOS"))

(defun prelude-pack-open-nixos-configuration-file! ()
  "Open nixos' configuration file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found "/etc/nixos/configuration.nix"))

(defun prelude-pack-open-nix-configuration-file! ()
  "Open nix's user configuration file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found "~/.nixpkgs/config.nix"))

(defun prelude-pack-open-tmux-configuration-file! ()
  "Open tmux's user configuration file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found "~/.tmux.conf"))

(defun prelude-pack-open-ssh-config ()
  "Open ssh's user configuration file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found "~/.ssh/config"))

(defun prelude-pack-box-connection-status ()
  "Open the box connection status."
  (interactive)
  (browse-url "http://mafreebox.freebox.fr/#Fbx.os.app.settings.ConnectionStatus"))

(require 'prelude-mode)

(defvar prelude-pack-mode-map
  (let ((map prelude-mode-map))
    (define-key map (kbd "C-c o") nil)
    (define-key map (kbd "C-c s") nil)
    (define-key map (kbd "C-c g") nil)
    (define-key map (kbd "C-c G") nil)
    (define-key map (kbd "C-c U") nil)
    (define-key map (kbd "C-c e") nil)
    (define-key map (kbd "C-c d") nil)
    (define-key map (kbd "C-c M-d") nil)
    (define-key map (kbd "C-c u") nil)
    (define-key map (kbd "C-c y") nil)
    (define-key map (kbd "C-c r") nil)
    (define-key map (kbd "C-c t") nil)
    (define-key map (kbd "C-c f") nil)
    (define-key map (kbd "C-c D") nil)
    (define-key map (kbd "C-c I") nil)
    (define-key map (kbd "C-c S") nil)
    (define-key map (kbd "C-c i") nil)
    (define-key map (kbd "C-c e") nil)
    (define-key map (kbd "C-c v u")   'crux-view-url)
    (define-key map (kbd "C-c v t")   'crux-visit-term-buffer)
    (define-key map (kbd "C-c w s")   'crux-swap-windows)
    (define-key map (kbd "C-c r D")   'crux-delete-file-and-buffer)
    (define-key map (kbd "C-c r M-d") 'crux-duplicate-and-comment-current-line-or-region)
    (define-key map (kbd "C-c r d")   'crux-duplicate-current-line-or-region)
    (define-key map (kbd "C-c r R")   'crux-rename-buffer-and-file)
    (define-key map (kbd "C-c r K")   'crux-kill-other-buffers)
    (define-key map (kbd "C-c r j")   'crux-top-join-line)
    (define-key map (kbd "C-c r k")   'crux-kill-whole-line)
    (define-key map (kbd "C-c f r")   'crux-recentf-ido-find-file)
    (define-key map (kbd "C-c f D")   'crux-delete-file-and-buffer)
    (define-key map (kbd "C-c f I")   'crux-find-user-init-file)
    (define-key map (kbd "C-M-q")     'crux-indent-defun)
    (define-key map (kbd "C-c m g")   'magit-status)
    (define-key map (kbd "C-c m l")   'magit-log)
    (define-key map (kbd "C-c m f")   'magit-file-log)
    (define-key map (kbd "C-c m B")   'magit-blame-mode)
    (define-key map (kbd "C-c r M-v") 'move-text-up)
    (define-key map (kbd "C-c r v")   'move-text-down)
    (define-key map (kbd "C-c b o")   'prelude-google)
    (define-key map (kbd "C-c b g")   'prelude-github)
    (define-key map (kbd "C-c b y")   'prelude-youtube)
    (define-key map (kbd "C-c b d")   'prelude-duckduckgo)
    (define-key map (kbd "C-c b b")   'prelude-pack-box-connection-status)
    (define-key map (kbd "C-c f x")   'prelude-pack-open-xmonad-init-file!)
    (define-key map (kbd "C-c f s")   'prelude-pack-open-stumpwm-init-file!)
    (define-key map (kbd "C-c f p")   'prelude-pack-open-prelude-packs-file!)
    (define-key map (kbd "C-c f t")   'prelude-pack-open-global-todo-file!)
    (define-key map (kbd "C-c f T")   'prelude-pack-open-tmux-configuration-file!)
    (define-key map (kbd "C-c f n")   'prelude-pack-open-nixos-configuration-file!)
    (define-key map (kbd "C-c f N")   'prelude-pack-open-nix-configuration-file!)
    (define-key map (kbd "C-c f h")   'prelude-pack-open-ssh-config)
    (define-key map (kbd "C-c f S")   'prelude-find-shell-init-file)
    map)
  "Keymap for prelude-pack mode.")

(define-minor-mode prelude-pack-mode
  "Minor mode to consolidate them-pack extensions.

\\{prelude-pack-mode-map}"
  :lighter " PP"
  :keymap prelude-pack-mode-map)

(define-globalized-minor-mode global-prelude-pack-mode prelude-pack-mode prelude-pack-on)

(defun prelude-pack-on ()
  "Turn on `prelude-pack-mode'."
  (prelude-pack-mode +1))

(provide 'prelude-pack)
;;; prelude-pack.el ends here
