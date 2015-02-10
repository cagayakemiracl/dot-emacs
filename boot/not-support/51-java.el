;;; init-java.el --- 

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

(require 'eclim)
(global-eclim-mode)
(add-hook 'java-mode-hook 'eclim-mode)
(require 'eclimd)

;(require 'ac-emacs-eclim-source)
;(ac-emacs-eclim-config)

(require 'company-emacs-eclim)
(company-emacs-eclim-setup)

;; 各自の環境に合わせてリンクを貼る
(setq eclim-eclipse-dirs "~/.emacs.d/eclipse")
(setq eclim-executable "~/.emacs.d/eclipse/eclim")
(setq eclimd-executable "~/.emacs.d/eclipse/eclimd")
(setq eclimd-default-workspace "~/workspace")

;(start-eclimd eclimd-default-workspace)

;;; Code:
