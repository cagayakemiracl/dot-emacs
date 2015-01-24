;;; init-ruby.el --- 

;; Copyright (C) 2014  Hiromasa Nakahara

;; Author: Hiromasa Nakahara <cagayakemiracl@gmail.com>
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

;;; Commentary:

;; 

;;; Code:

;; ruby-mode
(autoload 'enh-ruby-mode "enh-ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$latex " . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb$latex " . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(setq interpreter-mode-alist (append '(("ruby" . enh-ruby-mode))
									 interpreter-mode-alist))

;; inf-ruby
(autoload 'inf-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'enh-ruby-mode-hook
		  '(lambda ()
			 (inf-ruby-keys)))

;; ruby block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; ruby end
;(require 'ruby-end)
;(add-hook 'enh-ruby-mode-hook
;		  '(lambda ()
;			 (abbrev-mode 1)
;			 (electric-pair-mode t)
;			 (electric-indent-mode t)
;			 (electric-layout-mode t)))

;; ruby electric
(require 'ruby-electric)
(add-hook 'enh-ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; symbol's function definition is void ruby-insert-end というエラー対策
(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

;; auto complete
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-hook 'enh-ruby-mode-hook
		  '(lambda ()
			 (add-to-list 'ac-dictionary-files "~/.emacs.d/dict/enh-ruby-mode")
			 ))

;; highlight-indentation
(add-hook 'enh-ruby-mode-hook 'highlight-indentation-mode)

;; rode
(require 'robe)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; ctags update
(add-hook 'enh-ruby-mode-hook 'turn-on-ctags-auto-update-mode)

(add-hook 'enh-ruby-mode-hook 'highlight-symbol-mode)

;(require 'rcodetools)
;(setq rct-find-tag-if-available nil)
;(defun ruby-mode-hook-rcodetools ()
;  (define-key enh-ruby-mode-map "\C-c\C-d" 'xmp)
;  (define-key enh-ruby-mode-map "\M-\C-i" 'rct-complete-symbol)
;  (define-key enh-ruby-mode-map "\C-c\C-t" 'ruby-toggle-buffer)
;  (define-key enh-ruby-mode-map "\C-c\C-f" 'rct-ri))
;(add-hook 'enh-ruby-mode-hook 'ruby-mode-hook-rcodetools)

(require 'ruby-refactor)
(add-hook 'enh-ruby-mode-hook 'ruby-refactor-mode-launch)

(provide 'init-ruby)
;;; init-ruby ends here
