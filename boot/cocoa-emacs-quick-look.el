;;; cocoa-emacs-quick-look.el ---                    -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Hiromasa Nakahara

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

(defun do-ql-dwim()
  (interactive)
  (let* ((proc (get-buffer-process "*Async Shell Command*")))
    (if proc
		(kill-process proc)
      (dired-do-async-shell-command
       "qlmanage -p 2>/dev/null" ""
       (dired-get-marked-files))
      ))
  )

(add-hook 'anything-dired-mode-hook (lambda ()
							 (define-key dired-mode-map " " 'do-ql-dwim)
							 ))

(provide 'cocoa-emacs-quick-look)
;;; cocoa-emacs-quick-look.el ends here
