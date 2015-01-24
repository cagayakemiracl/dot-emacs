;;; init-sdic.el --- 

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

(require 'sdic)

(defvar dict-bin "/Users/masutaka/repository/commandline-dictionary-app/src/dict"
  "a path of commandline-dictionary-app")
 
(defun dictionary-app (word)
  "Display the meaning of word using Dictionary.app."
  (interactive (list (sdic-read-from-minibuffer)))
  (set-buffer (get-buffer-create sdic-buffer-name))
  (or (string= mode-name sdic-mode-name) (sdic-mode))
  (setq buffer-read-only nil)
  (erase-buffer)
  (insert (format "============================================================\n%s\n" word))
  (call-process dict-bin
                nil sdic-buffer-name t word
                "Japanese-English" "Japanese" "Japanese Synonyms")
  (setq buffer-read-only t)
  (set-buffer-modified-p nil)
  (sdic-display-buffer 0))
 
(defun dictionary-search (word)
  (browse-url
   (concat "dict:///" (url-hexify-string word))))
 
(defun my-dictionary (arg)
  (interactive "P")
  (cond
   ((equal arg '(16))
    (dictionary-app (sdic-read-from-minibuffer)))
   ((equal arg '(4))
    (sdic-describe-word (sdic-read-from-minibuffer)))
   (t
    (dictionary-search (sdic-read-from-minibuffer)))))

(global-set-key "\C-cw" 'my-dictionary)

(provide 'init-sdic)
;;; init-sdic.el ends here
