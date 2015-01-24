;;; init-c.el --- 

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

(require 'google-c-style)
(add-hook 'c-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c-mode-hook 'google-make-newline-indent)
(add-hook 'c++-mode-hook 'google-make-newline-indent)

;; eldoc
(load "c-eldoc")
(setq c-eldoc-cpp-command "/usr/bin/cpp")
(add-hook 'c-mode-common-hook 'c-turn-on-eldoc-mode)

;; auto complete
(require 'auto-complete-c-headers)
(defun my:ac-c-header-init ()
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/local/include/")
  (add-to-list 'achead:include-directories '"/usr/include/")
  )
; now let's call this function from c/c++ hooks
(add-hook 'c-mode-hook 'my:ac-c-header-init)
(add-hook 'c++-mode-hook 'my:ac-c-header-init)

(require 'auto-complete-clang-async)
(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "/usr/local/bin/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
    (setq ac-clang-cflags
        (mapcar (lambda (item)(concat "-I" item))
                (split-string
                 "
/usr/include/
/usr/local/include/
"
                 )))
  (ac-clang-launch-completion-process)
  )
(add-hook 'c-mode-hook 'ac-cc-mode-setup)
(add-hook 'c++-mode-hook 'ac-cc-mode-setup)

(add-hook 'c-mode-common-hook
		  (lambda ()
			 (setq flycheck-clang-include-path
				   '("/usr/include/"
					 "/usr/local/include/"))))

;; ctags update
(add-hook 'c-mode-common-hook  'turn-on-ctags-auto-update-mode)

(add-hook 'c-mode-common-hook 'highlight-symbol-mode)

(provide '50-c)
;;; 50-c.el ends here
