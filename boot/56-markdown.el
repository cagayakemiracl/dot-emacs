;;; 56-markdown.el ---                               -*- lexical-binding: t; -*-

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

(require 'markdown-mode)
(require 'pandoc-mode)

(setq auto-mode-alist (cons '("\\.md" . gfm-mode) auto-mode-alist))

(add-hook 'markdown-mode-hook 'pandoc-mode)

(setq markdown-command "pandoc -f markdown -t html5 -s -c ~/.emacs.d/pandoc/github.css")

(provide '56-markdown)
;;; 56-markdown.el ends here
