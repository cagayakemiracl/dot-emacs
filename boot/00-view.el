;;; init-view.el --- 

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

;; theme
(load-theme 'misterioso t)

;; ツールバーとスクロールバーの削除
(tool-bar-mode -1)
(set-scroll-bar-mode nil)

;; タイトルにフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; 行番号の表示
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#800"
                    :height 0.9)

;; 背景を透明にする
(add-to-list 'default-frame-alist '(alpha . (0.85 0.70)))

;; 現在行をハイライト
;(global-hl-line-mode t)

;; 括弧をハイライト
(show-paren-mode t)

;; 括弧自動挿入
(electric-pair-mode 1)

;;; 00-view.el ends here
