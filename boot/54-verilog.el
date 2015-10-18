;;; 54-verilog.el ---                                -*- lexical-binding: t; -*-

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

(require 'verilog-mode)

;; Use this parameter as C++ default
(require 'flycheck)
(eval-after-load "flycheck"
  '(progn
		 (flycheck-define-checker verilog-verilator
			 "A Verilog syntax checker using the Verilator Verilog HDL simulator."
			 :command ("verilator_bin" "--lint-only" "-Wall" (eval verilog-library-files) source)
			 :error-patterns ((warning line-start "%Warning-" (zero-or-more not-newline) ": " (file-name) ":" line ": " (message) line-end)
												(error line-start "%Error: " (file-name) ":" line ": " (message) line-end))
			 :modes (verilog-mode))
		 ))

;;; verilog-mode
(eval-after-load "verilog-mode"
  '(progn
		 ;; 基本設定
		 (setq verilog-indent-level 4
					 verilog-indent-level-module 4
					 verilog-indent-level-declaration 4
					 verilog-indent-declaration-macros nil
					 verilog-indent-lists t
					 verilog-indent-level-behavioral 4
					 verilog-indent-level-directive 4
					 verilog-case-indent 4
					 verilog-cexp-indent 4
					 verilog-auto-newline nil
					 verilog-auto-indent-on-newline t
					 verilog-tab-always-indent nil
					 verilog-tab-to-comment t
					 verilog-auto-endcomments t
					 verilog-indent-begin-after-if t
					 verilog-align-ifelse t
					 verilog-auto-lineup nil
					 verilog-minimum-comment-distance 40
					 verilog-highlight-p1800-keywords t
					 verilog-linter "verilator_bin --lint-only -Wall")
		 ;; 数値リテラルのフェイス設定
		 (font-lock-add-keywords
			'verilog-mode
			'(("\\(\\<[1-9][0-9_]*\\)?'h[0-9_a-fxz]+\\>" . font-lock-string-face) ; 16進数
				("\\(\\<[1-9][0-9_]*\\)?'d[0-9_xz]+\\>" . font-lock-string-face) ; 10進数
				("\\(\\<[1-9][0-9_]*\\)?'o[0-7_xz]+\\>" . font-lock-string-face) ; 8進数
				("\\(\\<[1-9][0-9_]*\\)?'b[01_xz]+\\>" . font-lock-string-face) ; 2進数
				("\\<[0-9][0-9_]*\\>" . font-lock-string-face))) ; 基数なし
		 ))

(add-hook 'verilog-mode-hook 'auto-complete-mode)

(provide '54-verilog)
;;; 54-verilog.el ends here
