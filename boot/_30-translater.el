;;; init-translater.el --- 

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

;(require 'text-translator)
(require 'text-translator-load)

;; デフォルト翻訳サイトの設定
(setq text-translator-default-engine "freetranslation.com_enja")
;(setq text-translator-default-engine "excite.co.jp_enja")

;; 自動選択に使用する関数を設定
(setq text-translator-auto-selection-func
	        'text-translator-translate-by-auto-selection-enja)

(global-set-key "\C-xt" 'text-translator-translate-by-auto-selection)

(provide 'init-translater)
;;; init-translater.el ends here
