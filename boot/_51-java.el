;;; init-java.el --- 

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

(require 'malabar-mode)

(defun malabar-mode-bootstrap ()
  (require 'cedet)
  (require 'semantic)
  (load "semantic/loaddefs.el")
  (semantic-mode 1)
;  (load "malabar-flycheck")
  (auto-complete-mode)
;  (flymake-mode-on)
  (malabar-mode))
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode-bootstrap))

;;; init-java.el ends here
