;;; init-python.el --- 

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

;; python

;; flycheck
(require 'flycheck-pyflakes)
(require 'jedi)

(add-hook 'python-mode-hook 'flycheck-mode)
(add-to-list 'flycheck-disabled-checkers 'python-flake8)
(add-to-list 'flycheck-disabled-checkers 'python-pylint)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; highlight-indentation
(add-hook 'python-mode-hook 'highlight-indentation-mode)

(provide 'init-python)
;;; init-python.el ends here
