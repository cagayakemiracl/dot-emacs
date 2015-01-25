;;; init-scss.el --- 

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

;; scss
(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

;; インデント幅を2にする
;; コンパイルは compass watchで行うので自動コンパイルをオフ
(defun scss-custom ()
	"scss-mode-hook"
	(and
	 (set (make-local-variable 'scss-compile-at-save) nil)
	 )
	)
(add-hook 'scss-mode-hook
					'(lambda() (scss-custom)))

;; auto complete
;(add-to-list 'ac-modes 'scss-mode)
;(add-hook 'scss-mode-hook
;		  '(lambda ()
;			 (add-to-list 'ac-dictionary-files "~/.emacs.d/dict/scss-mode")))

;; rainbow mode
(add-hook 'scss-mode-hook 'rainbow-mode)

(provide 'init-scss)
;;; init-scss.el ends here
