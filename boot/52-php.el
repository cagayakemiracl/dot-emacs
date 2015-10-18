;;; init-php.el --- 

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

;; php
(require 'php-mode)
(require 'php-completion)
(setq php-mode-force-pear t) ;PEAR規約のインデント設定にする
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode)) ;*.phpのファイルのときにphp-modeを自動起動する

(require 'auto-complete)
(add-to-list 'ac-modes 'php-mode)
(add-hook 'php-mode-hook
		  (lambda ()
			(php-completion-mode t)
			(define-key php-mode-map (kbd "C-o") 'phpcmp-complete) ;php-completionの補完実行キーバインドの設定
			(make-local-variable 'ac-sources)
			(setq ac-sources '(
							   ac-source-words-in-same-mode-buffers
							   ac-source-php-completion
							   ac-source-filename
							   ))))

;; rainbow mode
(add-hook 'php-mode-hook 'rainbow-mode)

(provide 'init-php)
;;; init-php.el ends here
