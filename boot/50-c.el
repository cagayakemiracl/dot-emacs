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
(add-to-list 'auto-mode-alist '("\\.mm$" . c++-mode))

(require 'google-c-style)
(add-hook 'c-mode-hook 'google-set-c-style)
(add-hook 'c-mode-hook 'google-make-newline-indent)

(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-make-newline-indent)

(require 'flycheck)
(defun flycheck-cc-mode-setup ()
  (setq flycheck-clang-language-standard "c++14")
	)

(add-hook 'c++-mode-hook 'flycheck-cc-mode-setup)

(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     ;; Add Google C++ Style checker.
     ;; In default, syntax checked by Clang and Cppcheck.
     (flycheck-add-next-checker 'c/c++-clang
                                'c/c++-googlelint 'append)))

(require 'auto-complete-clang-async)
(require 'auto-complete-c-headers)

(defun ac-cc-mode-setup ()
  (add-to-list 'ac-sources 'ac-source-clang-async)
	(add-to-list 'ac-sources 'ac-source-c-headers)
  (ac-clang-launch-completion-process)
	)

(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)

(add-hook 'c-mode-common-hook 'highlight-indentation-current-column-mode)
(add-hook 'c-mode-common-hook 'highlight-indentation-mode)

(require 'clang-format)
(custom-set-variables '(clang-format-style "Google"))
(add-hook 'c-mode-common-hook
					'(lambda ()
						(define-key c-mode-map (kbd "<f6>") 'clang-format-buffer)
						(define-key c++-mode-map (kbd "<f6>") 'clang-format-buffer)
						))

(require 'cpputils-cmake)
(add-hook 'c-mode-common-hook
          (lambda ()
            (if (derived-mode-p 'c-mode 'c++-mode)
                (cppcm-reload-all)
              )))

(provide '50-c)

;;; 50-c.el ends here
