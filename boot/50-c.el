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
;(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(add-hook 'c-mode-hook 'google-set-c-style)
(add-hook 'c-mode-hook 'google-make-newline-indent)

(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-make-newline-indent)

;; eldoc
(load "c-eldoc")
(setq c-eldoc-cpp-command "/usr/bin/cpp")
(add-hook 'c-mode-common-hook 'c-turn-on-eldoc-mode)

(defun get-include-dirs ()
  (let* ((command-result (shell-command-to-string "echo \"\" | clang++ -v -x c++ -E -"))
         (start-string "#include <...> search starts here:\n")
         (end-string "End of search list.\n")
         (start-pos (string-match start-string command-result))
         (end-pos (string-match end-string command-result))
         (include-string (substring command-result (+ start-pos (length start-string)) end-pos)))
    (split-string include-string)))

(setq all-include-dir (append '("." "/usr/local/include/QtGui" "/usr/local/include/QtCore") (get-include-dirs)))
(setq my-c-flags
	  (mapcar (lambda (item) (concat "-I" item)) all-include-dir))

(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
(setq company-c-headers-path-system all-include-dir)

(defun flycheck-cc-mode-setup ()
  (setq flycheck-clang-language-standard "c++11")
  ;(setq flycheck-clang-standard-library "libc++")
  (setq flycheck-clang-include-path all-include-dir)
  )
(add-hook 'c-mode-common-hook 'flycheck-cc-mode-setup)

;; ctags update
(add-hook 'c-mode-common-hook 'turn-on-ctags-auto-update-mode)
(add-hook 'c-mode-common-hook 'highlight-symbol-mode)

(setq company-clang-arguments '("-std=c++11" "-pthread"))
(setq company-clang-arguments (append company-clang-arguments my-c-flags))
	  
;; Use this parameter as C++ default
(quickrun-add-command "c++/c11"
                      '((:command . "clang++")
                        (:exec    . ("%c -std=c++11 -pthread %o -o %e %s"
                                     "%e %a"))
                        (:remove  . ("%e")))
                      :default "c++")

(require 'clang-format)
(global-set-key  (kbd "<f6>") 'clang-format-region)

(provide '50-c)
;;; 50-c.el ends here
