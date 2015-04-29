;;; init-indent.el --- 

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

;; tab indent number
(setq-default tab-width 2)
(setq indent-tabs-mode nil)
(setq tab-width 2)
;(setq tab-stop-list
;	    '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
(setq indent-line-function 'indent-relative-maybe)
(column-number-mode t)
(line-number-mode t)

(provide 'init-indent)
;;; init-indent.el ends here
