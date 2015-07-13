;;; init-key.el --- 

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

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key (kbd "C-x C-z") 'open-junk-file)
(global-set-key "\C-m" 'newline-and-indent)

(setq suggest-key-bindings t)
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-key)
;;; init-key.el ends here
