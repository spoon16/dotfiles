;; BEGIN ensure packages are installed
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings paredit clojure-mode)
  "Ensure these packages are installed")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p))) ;; <-- how do i get these to load on start?
;; END ensure packages are installed



