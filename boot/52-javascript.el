;;; init-javascript.el --- 

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

(require 'js2-mode)
(require 'jquery-doc)
(autoload 'tern-mode "tern" nil t)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook
          #'(lambda ()
              (setq js2-basic-offset 2
                    indent-tabs-mode nil)
              ))

(add-to-list 'ac-modes 'js2-mode)

(add-hook 'js2-mode-hook 'jquery-doc-setup)

(add-hook 'js2-mode-hook
          (lambda ()
            (tern-mode t)))

(eval-after-load 'tern
	'(progn
		 (require 'tern-auto-complete)
		 (tern-ac-setup)))

;; disable jshint since we prefer eslint checking
(require 'flycheck)
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

(provide 'init-javascript)
;;; init-javascript.el ends here
