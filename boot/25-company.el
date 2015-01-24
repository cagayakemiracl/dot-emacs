;;; 25-company.el ---                                -*- lexical-binding: t; -*-

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

(require 'company)
;(require 'company-bundled-completions)
;(company-install-bundled-completions-rules)

;; RET で補完の確定
(define-key company-active-map (kbd "") 'company-expand-top)
;; M-h で明示的に補完候補の表示
(define-key company-mode-map "\M-h" 'company-start-showing)

(provide '25-company)
;;; 25-company.el ends here
