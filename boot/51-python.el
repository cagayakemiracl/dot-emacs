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
(require 'py-autopep8)
(require 'python)

(add-hook 'python-mode-hook 'flycheck-mode)
(add-to-list 'flycheck-disabled-checkers 'python-flake8)
(add-to-list 'flycheck-disabled-checkers 'python-pylint)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:environment-root "jedi")  ; or any other name you like
(setq jedi:environment-virtualenv
      (append python-environment-virtualenv
              '("--python" "/usr/local/bin/python3")))

(define-key python-mode-map (kbd "<f6>") 'py-autopep8) 
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(add-hook 'python-mode-hook 'highlight-indentation-mode)

(provide 'init-python)
;;; init-python.el ends here
