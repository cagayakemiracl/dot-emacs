;;; init-coffee.el --- 

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

;; coffee script
(require 'coffee-mode)
(defun coffee-custom ()
  "coffee-mode-hook"
  (and (set (make-local-variable 'tab-width) 2)
	   (set (make-local-variable 'coffee-tab-width) 2))
  )
(add-hook 'coffee-mode-hook
		  '(lambda() (coffee-custom)))
(add-to-list 'auto-mode-alist '("\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; 保存したとき、拡張子以外同名のjsバッファをリロードする
(defun revert-compiled-coffee ()
  (interactive)
  (with-current-buffer
	  (concat (file-name-sans-extension (buffer-name (current-buffer))) ".js")
	(revert-buffer nil t)))
(add-hook 'coffee-mode-hook
		  (lambda ()
			(add-hook 'after-save-hook 'revert-compiled-coffee nil t)))


;; auto complete
(add-to-list 'ac-modes 'coffee-mode)
(add-hook 'coffee-mode-hook
		  '(lambda ()
			 (add-to-list 'ac-dictionary-files "~/.emacs.d/dict/js2-mode")
			 ))

;; highlight-indentation
(add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'coffee-mode-hook 'highlight-indentation-mode)

(provide 'init-coffee)
;;; init-coffee.el ends here
