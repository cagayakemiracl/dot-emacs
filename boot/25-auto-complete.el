;;; init-ac.el --- 

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

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
;(ac-config-default)
(setq-default ac-sources
              '(ac-source-yasnippet
                ac-source-abbrev
                ac-source-filename
                ac-source-files-in-current-dir
                ac-source-dictionary
                ac-source-words-in-same-mode-buffers
                ))
(setq ac-auto-start t)
;; key bind
(setq ac-use-menu-map t)

(provide 'init-ac)
;;; init-ac.el ends here
