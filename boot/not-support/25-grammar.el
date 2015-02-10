;;; init-grammar.el --- 

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

(add-to-list 'load-path "~/.emacs.d/svn/grammar/")
(require 'grammar)

(setq grammar-program-name "~/.emacs.d/svn/grammar/grammar")
;; 黒背景だとデフォルトの色はみずらかったので変更
;(set-face-attribute 'grammar-error-face nil
;                    :background "#Ff6347"
;                    :foreground "#000000")
;(define-key grammar-mode-map (kbd "C-M-g") nil)
(global-set-key (kbd "C-\]") 'grammar-check)
(add-hook 'text-mode-hook 'grammar-mode)

(provide 'init-grammar)
;;; init-grammar.el ends here
