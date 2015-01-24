;;; 60-insert-elisp-file-info.el --- 60-insert-elisp-file-info.el

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

(defun insert-elisp-file-info ()
  "Insert Emacs Lisp header info."
  (interactive)
  (goto-char (point-min))
  (let ((f (file-name-nondirectory (buffer-file-name)))
        (f-noext (file-name-base)))
    (insert (format ";;; %s --- %s\n" f f))
    (insert (format ";; Author: %s\n" user-full-name))
    (insert ";; Version: \n")
    (insert ";; Package-Requires: ()\n")
    (insert ";;; Commentary:\n")
    (insert ";; This program is free software\n")
    (insert ";;; Code:\n\n")
    (goto-char (point-max))
    (save-excursion
      (insert (format "\n(provide '%s)\n" f-noext))
      (insert (format ";;; %s ends here\n" f))
    )))

(provide '60-insert-elisp-file-info)
;;; 60-insert-elisp-file-info.el ends here
