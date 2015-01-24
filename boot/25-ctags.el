;;; init-ctags.el --- 

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

(require 'ctags)
(require 'ctags-update)
(autoload 'turn-on-ctags-auto-update-mode "ctags-update" "turn on `ctags-auto-update-mode'." t)
(add-hook 'emacs-lisp-mode-hook  'turn-on-ctags-auto-update-mode)
(require 'anything-exuberant-ctags)
(setq anything-exuberant-ctags-enable-tag-file-dir-cache t)
(setq anything-exuberant-ctags-cache-tag-file-dir "~/.emacs/cache/")
(define-key global-map [(control @)] 'anything-exuberant-ctags-select-from-here)

(provide 'init-ctags)
;;; init-ctags.el ends here
