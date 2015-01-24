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

(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; eldoc
(load "c-eldoc")
(setq c-eldoc-cpp-command "/usr/bin/cpp")
(add-hook 'c-mode-common-hook 'c-turn-on-eldoc-mode)

(defun get-include-dirs ()
  (let* ((command-result (shell-command-to-string "echo \"\" | g++ -v -x c++ -E -"))
         (start-string "#include <...> search starts here:\n")
         (end-string "End of search list.\n")
         (start-pos (string-match start-string command-result))
         (end-pos (string-match end-string command-result))
         (include-string (substring command-result (+ start-pos (length start-string)) end-pos)))
    (split-string include-string)))

(require 'auto-complete-c-headers)
(require 'auto-complete-clang-async)
(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "/usr/local/bin/clang-complete")
  (setq ac-sources (append '(ac-source-clang-async ac-source-c-headers) ac-sources))
  (setq ac-clang-cflags
        (mapcar (lambda (item)(concat "-I" item)) (get-include-dirs)))
  (ac-clang-launch-completion-process)
  )
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)

(defun flycheck-cc-mode-setup ()
  (setq flycheck-clang-include-path (list "." ".." "../include" "include" "/usr/local/include/QtGui" "/usr/local/include/QtCore"))
  )
(add-hook 'c-mode-common-hook 'flycheck-cc-mode-setup)

;; ctags update
(add-hook 'c-mode-common-hook  'turn-on-ctags-auto-update-mode)
(add-hook 'c-mode-common-hook 'highlight-symbol-mode)

(provide '50-c)
;;; 50-c.el ends here
