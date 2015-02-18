;;; init-auto-insert.el --- 

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

;; auto-insert
(setq user-id-string "cagayakemiracl")
(setq user-full-name "Hiromasa Nakahara")
(setq user-mail-address "cagayakemiracl@gmail.com")
(require 'autoinsert)
(auto-insert-mode 1)
(setq auto-insert-directory "~/.emacs.d/template/")
;; 各ファイルによってテンプレートを切り替える
(setq auto-insert-alist
	  (nconc '(
			   ("\\.[Cc]+[Pp]*\\'"    . ["template.cpp" my-template])
			   ("\\.h$"      . ["template.h" my-template])
			   ("\\.rb$"     . ["template.rb" my-template])
			   ("\\.py$"     . ["template.py" my-template])
			   ("\\.coffee$" . ["template.coffee" my-template])
			   ("\\.v$"      . ["template.v" my-template])
			   ("\\.cs$"     . ["template.cs" my-template])
			   ("\\.html$"   . ["template.html" my-template])
			   ("\\.pl$"     . ["template.pl" my-template])
			   ("\\.php$"    . ["template.php" my-template])
			   ) auto-insert-alist))
(defvar template-replacements-alists
  '(("%file%"             . (lambda () (file-name-nondirectory (buffer-file-name))))
	("%file-without-ext%" . (lambda () (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))
	("%include-guard%"    . (lambda () (format "%s_H_" (upcase (file-name-sans-extension (file-name-nondirectory buffer-file-name))))))
    ("%date%" . (lambda() (substring (current-time-string) -4)))
    ("%mail%" . (lambda () (identity user-mail-address)))
    ("%name%" . (lambda () (identity user-full-name)))
    ("%id%" . (lambda () (identity user-id-string)))))
(defun my-template ()
  (time-stamp)
  (mapc #'(lambda(c)
			(progn
			  (goto-char (point-min))
			  (replace-string (car c) (funcall (cdr c)) nil)))
		template-replacements-alists)
  (goto-char (point-max))
  (message "done."))
(add-hook 'find-file-hook 'auto-insert)

(provide 'init-auto-insert)
;;; init-auto-insert.el ends here
