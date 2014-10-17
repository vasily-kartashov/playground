(add-to-list 'load-path "/home/vagrant/haskell-mode/")
(load "haskell-mode-autoloads.el")
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(add-to-list 'load-path "/home/vagrant/sh-script/")
(load "sh-script.el")

(add-to-list 'load-path "/home/vagrant/cc-mode/")

(add-to-list 'load-path "/home/vagrant/rust/src/etc/emacs/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
