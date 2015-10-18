;;; init-multi-term.el --- 

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

;;term
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(add-hook 'term-mode-hook
					'(lambda ()
						 (define-key term-raw-map "\C-y" 'term-paste)
						 (define-key term-raw-map "\C-q" 'move-beginning-of-line)
						 (define-key term-raw-map "\C-f" 'forward-char)
						 (define-key term-raw-map "\C-b" 'backward-char)			     
						 (define-key term-raw-map "\C-t" 'set-mark-command)			     
						 (define-key term-raw-map (kbd "ESC") 'term-send-raw)
						 (define-key term-raw-map [delete] 'term-send-raw)
						 (define-key term-raw-map "\C-z"
							 (lookup-key (current-global-map) "\C-z"))))
(global-set-key (kbd "C-c n") 'multi-term-next)
(global-set-key (kbd "C-c p") 'multi-term-prev)

(setq system-uses-terminfo nil)

(provide 'init-multi-term)
;;; init-multi-term.el ends here
