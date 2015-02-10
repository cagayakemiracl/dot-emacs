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
(setq auto-mode-alist (cons '("\\.md" . gfm-mode) auto-mode-alist))

(setq markdown-command "pandoc --mathjax -t html5 -s -c ~/.emacs.d/css/github.css")
(setq markdown-xhtml-header-content "
<link rel=\"stylesheet\" type=\"text/css\" media=\"all\" 
href=\"~/.emacs.d/css/github.css\" />
")

(provide '56-markdown)
;;; 56-markdown.el ends here
