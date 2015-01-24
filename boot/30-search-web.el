;;; init-search-web.el --- 

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

(require 'search-web)

(defun search-web-at-point (&optional arg-engine)
  (interactive)
  (message "sw: %s" arg-engine)
  (let* ((completion-ignore-case t)
         (search-word (substring-no-properties (thing-at-point 'word)))
         (engine (or arg-engine (completing-read (format "[%s] Search Engine: " search-word)
                                   (make-search-engine-name-list) nil t))))
  (search-web engine search-word)))

(defun search-web-region (&optional arg-engine)
  (interactive)
  (let* ((completion-ignore-case t)
         (beg (mark))
         (end (point))
         (search-word (buffer-substring-no-properties beg end))
         (engine (or arg-engine (completing-read (format "[%s] Search Engine: " search-word)
                                   (make-search-engine-name-list) nil t))))
    (search-web engine search-word)))

(define-prefix-command 'search-web-map)
(global-set-key (kbd "M-i") 'search-web-map)

(global-set-key (kbd "M-i g") (lambda () (interactive) (search-web-at-point "google")))
(global-set-key (kbd "M-i e") (lambda () (interactive) (search-web-at-point "eijiro")))

(global-set-key (kbd "M-I g") (lambda () (interactive) (search-web-region "google")))
(global-set-key (kbd "M-I e") (lambda () (interactive) (search-web-region "eijiro")))

(provide 'init-search-web)
;;; init-search-web.el ends here
