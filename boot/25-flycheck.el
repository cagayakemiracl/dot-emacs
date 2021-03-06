;;; init-flycheck.el ---

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

;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

(require 'flycheck-pos-tip)
(eval-after-load 'flycheck
  '(custom-set-variables
	'(flycheck-display-errors-function 'flycheck-pos-tip-error-messages)))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-cask-setup))

;(require 'flycheck-tip)
;(define-key global-map (kbd "C-c C-n") 'error-tip-cycle-dwim)
;(define-key global-map (kbd "C-c C-p") 'error-tip-cycle-dwim-reverse)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
