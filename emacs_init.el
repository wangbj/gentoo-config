(setq inhibit-splash-screen t)
(setq inhibit-startup-message t) 
(column-number-mode t)

(cua-mode 1)

;; recursively add ~/.emacs.d/lisp
;(let ((default-directory "~/.emacs.d/lisp/"))
;    (normal-top-level-add-subdirs-to-load-path))

;; disable backup files
(setq make-backup-files nil)
;;
;; ;; disable auto save
(auto-save-mode -1)
;;

;; line numbers
(if (>= emacs-major-version 23) (require 'linum))

(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")))))

;(require 'cl-lib)

(add-to-list 'package-archives
         '("melpa" . "https://stable.melpa.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(custom-set-variables '(haskell-process-type 'stack-ghci))

(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(add-to-list 'load-path "~/.cabal/share/x86_64-linux-ghc-7.10.3/ghc-mod-5.5.0.0")

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
