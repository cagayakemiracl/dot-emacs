;;; init-csharp.el --- 

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

(require 'csharp-mode)
(autoload 'csharp-mode "csharp-mode" nil t)
(add-to-list 'auto-mode-alist '("\.cs$" . csharp-mode))
(modify-coding-system-alist 'file "\\.cs\\'" 'utf-8-with-signature-unix)
(add-hook 'csharp-mode-hook
		  '(lambda()
			 (setq comment-column 40)
			 (setq c-basic-offset 4)
			 (font-lock-add-magic-number)
			 (c-set-offset 'substatement-open 0)
			 (c-set-offset 'case-label '+)
			 (c-set-offset 'arglist-intro '+)
			 (c-set-offset 'arglist-close 0)
			 )
		  )

;; omnisharp
; https://github.com/OmniSharp/omnisharp-server
(require 'omnisharp)
(setq omnisharp-server-executable-path (expand-file-name "~/.emacs.d/OmniSharpServer/OmniSharp/bin/Debug/OmniSharp.exe")) ;; 各自設定

(defun my-csharp-mode ()
  (add-to-list 'company-backends 'company-omnisharp)
  (omnisharp-mode)
  (flycheck-mode)
  (company-mode)
  (turn-on-eldoc-mode)
  )

(setq omnisharp-company-strip-trailing-brackets nil)
(add-hook 'csharp-mode-hook 'my-csharp-mode)

(defun my-omnisharp-start (sln)
  (interactive "fOpen sln: ")
  (omnisharp-start-omnisharp-server (expand-file-name sln)))

(provide 'init-csharp)
;;; init-csharp-mode.el ends here
