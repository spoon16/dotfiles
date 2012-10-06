;; ===> Ensure desired packages are installed
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))
(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      paredit
                      slime-repl
                      clojure-mode))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; ===> Place all backup files in the same place
;; Enable backup files
(setq make-backup-files 1)
;; Save all backup files in a specific directory
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))

;; ===> Configure and enable whitespace mode
;; make whitespace-mode use “¶” for newline and “▷” for tab.
;; together with the rest of its defaults
(setq whitespace-display-mappings
      '((space-mark 32 [183] [46]) ; normal space, ·
        (space-mark 160 [164] [95])
        (space-mark 2208 [2212] [95])
        (space-mark 2336 [2340] [95])
        (space-mark 3616 [3620] [95])
        (space-mark 3872 [3876] [95])
        (newline-mark 10 [182 10]) ; newlne, ¶
        (tab-mark 9 [8677 9] [92 9]) ; tab, ⇥
        ))
;; turn whitespace mode on
(global-whitespace-mode 1)
;; set whitespace line column limit and identify whitespace style,
;; used to set different elements as "visible" and used by
;; whitespace-cleanup command
(setq-default whitespace-line-column 120
              whitespace-style '(empty
                                 indentation::space
                                 spaces-before-tabs::space
                                 trailing
                                 spaces
                                 space-mark
                                 tabs
                                 tab-mark
                                 newline
                                 newline-mark))
;; cleanup whitespace on save
(add-hook 'before-save-hook 'whitespace-cleanup)

;; ===> DEFAULT FONT
;; user 10pt Consolas as default font
(set-face-attribute 'default nil
                    :family "Consolas" :height 130)

;; ===> Start EMACS server so that clients (Terminal app in OSX) can
;; properly open new buffers in emacs app
(server-start)
