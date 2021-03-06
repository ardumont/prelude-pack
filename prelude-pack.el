;;; prelude-pack.el --- prelude-pack's bindings

;; Copyright (C) 2014-2018  Antoine R. Dumont (@ardumont)
;; Author: Antoine R. Dumont (@ardumont) <antoine.romain.dumont@gmail.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; This file is NOT part of GNU Emacs.

;;; Commentary:

;;; Code:

(require 'crux)
(require 'projectile)
(projectile-global-mode)
(require 'helm)

(custom-set-variables '(projectile-completion-system 'helm))

(defun prelude-pack-log (&rest msg)
  "Log MSG."
  (apply 'message (format "Prelude-Pack - %s" (car msg)) (cdr msg)))

(defun prelude-pack--find-file-if-exists-or-log-not-found (file)
  "Open a FILE if found or do nothing but log."
  (if (file-exists-p file)
      (find-file file)
    (prelude-pack-log "%s not found, do nothing." file)))

(defun prelude-pack-open-xmonad-init-file ()
  "Open xmonad's init file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found "~/.xmonad/xmonad.hs"))

(defun prelude-pack-open-stumpwm-init-file ()
  "Open stumpwm's init file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found "~/.stumpwmrc"))

(defun prelude-pack-open-prelude-packs-file ()
  "Open prelude-packs's init file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found
   "~/.prelude-packs/prelude-packs.el"))

(defun prelude-pack-open-global-todo-file ()
  "Open the user's org todo file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found "~/org/todo.org"))

(defun prelude-pack-open-swh-todo-file ()
  "Open the user's swh todo file."
  (interactive)
  (let ((swh-todo-file
	 (format "%s/org/todo.org" (getenv "SWH_ENVIRONMENT_HOME"))))
    (prelude-pack--find-file-if-exists-or-log-not-found swh-todo-file)))

(defun prelude-pack-nixos-env-p ()
  "Predicate to determine if on nixos or not."
  (prelude-pack--find-file-if-exists-or-log-not-found "/etc/NIXOS"))

(defun prelude-pack-open-nixos-configuration-file ()
  "Open nixos' configuration file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found
   "/etc/nixos/configuration.nix"))

(defun prelude-pack-open-nix-configuration-file ()
  "Open nix's user configuration file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found "~/.nixpkgs/config.nix"))

(defun prelude-pack-open-tmux-configuration-file ()
  "Open tmux's user configuration file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found "~/.tmux.conf"))

(defun prelude-pack-open-ssh-config ()
  "Open ssh's user configuration file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found "~/.ssh/config"))

(defun prelude-pack-open-xkeysnail-config ()
  "Open ssh's user configuration file."
  (interactive)
  (prelude-pack--find-file-if-exists-or-log-not-found
   "~/.config/xkeysnail/config.py"))

(defun prelude-pack-box-connection-status ()
  "Open the box connection status."
  (interactive)
  (browse-url
   "http://mafreebox.freebox.fr/#Fbx.os.app.settings.ConnectionStatus"))

(defvar prelude-pack-mode-map nil
  "Keymap for prelude-pack mode.")
(setq prelude-pack-mode-map
      (let ((map (make-sparse-keymap)))
	(define-key map (kbd "C-c v u")   'crux-view-url)
	(define-key map (kbd "C-c v t")   'crux-visit-term-buffer)
	(define-key map (kbd "C-c w s")   'crux-swap-windows)
	(define-key map (kbd "C-c r D")   'crux-delete-file-and-buffer)
	(define-key map (kbd "C-c r M-d")
	  'crux-duplicate-and-comment-current-line-or-region)
	(define-key map (kbd "C-c r d")
	  'crux-duplicate-current-line-or-region)
	(define-key map (kbd "C-c r R")   'crux-rename-buffer-and-file)
	(define-key map (kbd "C-c r K")   'crux-kill-other-buffers)
	(define-key map (kbd "C-c r j")   'crux-top-join-line)
	(define-key map (kbd "C-c r k")   'crux-kill-whole-line)
	(define-key map (kbd "C-c r r")   'revert-buffer)
	(define-key map (kbd "C-c f r")   'crux-recentf-ido-find-file)
	(define-key map (kbd "C-c f D")   'crux-delete-file-and-buffer)
	(define-key map (kbd "C-c f i")   'crux-find-user-init-file)
	(define-key map (kbd "C-c f k")   'prelude-pack-open-xkeysnail-config)
	(define-key map (kbd "C-M-q")     'crux-indent-defun)
	(define-key map (kbd "C-c b b")   'prelude-pack-box-connection-status)
	(define-key map (kbd "C-c f x")   'prelude-pack-open-xmonad-init-file)
	(define-key map (kbd "C-c f s")   'prelude-pack-open-swh-todo-file)
	(define-key map (kbd "C-c f S")   'prelude-pack-open-stumpwm-init-file)
	(define-key map (kbd "C-c f p")   'prelude-pack-open-prelude-packs-file)
	(define-key map (kbd "C-c f t")   'prelude-pack-open-global-todo-file)
	(define-key map (kbd "C-c f T")
	  'prelude-pack-open-tmux-configuration-file)
	(define-key map (kbd "C-c f n")
	  'prelude-pack-open-nixos-configuration-file)
	(define-key map (kbd "C-c f N")
	  'prelude-pack-open-nix-configuration-file)
	(define-key map (kbd "C-c f h")
	  'prelude-pack-open-ssh-config)
	(define-key map (kbd "C-c p")     'projectile-command-map)
	map))

(define-minor-mode prelude-pack-mode
  "Minor mode to consolidate them-pack extensions.

\\{prelude-pack-mode-map}"
  :lighter " PP"
  :keymap prelude-pack-mode-map
  :global t)

(define-globalized-minor-mode global-prelude-pack-mode prelude-pack-mode
  prelude-pack-on)

(defun prelude-pack-on ()
  "Turn on `prelude-pack-mode'."
  (prelude-pack-mode +1))

(provide 'prelude-pack)
;;; prelude-pack.el ends here
