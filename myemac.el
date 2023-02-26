;;; myemacs.el --- my emacs funcs

;; Copyright (C) 2006  Free Software Foundation, Inc.

;; Author:
;; Keywords: convenience

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; 

;;; Code:
(defun run-buffer ()
  (interactive)
  (shell-command (buffer-name)))

(defun checkout-buffer ()
  (interactive)
  (shell-command (concat "p4 edit " buffer-file-name) nil nil)
  (revert-buffer t t))

(defun register-buffer ()
  (interactive)
  (shell-command (concat "p4 add " buffer-file-name) nil nil)
  (revert-buffer t t))

(defun p4revert-buffer ()
  (interactive)
  (shell-command (concat "p4 revert " buffer-file-name) nil nil)
  (revert-buffer t t))

(defun exec-buffer ()
  (interactive)
  (shell-command (concat "x " buffer-file-name) nil nil))

(defun noext ()
  (substring (file-name-nondirectory buffer-file-name) 0 -5))

(defun makethis (arg)
  "Run gmake command on buffer name."
  (interactive "p")
  (compile (concat "javac " buffer-file-name)))

(defun ant ()
  "Run ant command."
  (interactive "p")
  (compile "ant"))


(defun refresh (arg)
  "Refresh the current buffer."
  (interactive "p")
  (revert-buffer t t))

(defun perl-list-print (arg)
  "Print a list of perl vars."
  (interactive "p")
  (kill-ring-save (point) (mark))
  (next-line 1)
  (beginning-of-line)
  (open-line 1)
  (cperl-indent-command)
  (insert-string "$logger->log(\"\" . Dumper());")
  (backward-char 3)
  (yank))


(defun split-perl-string (arg)
  "Split Perl string."
  (interactive "p")
  (insert-string "\" .")
  (newline-and-indent)
  (insert-string "\""))
  
(defun close-all-files ()
  "Kill all buffers that are visiting a file."
  (interactive)
  (let ((buffers (buffer-list)))
    (while buffers
      (kill-buffer (car buffers))
      (setq buffers (cdr buffers)))))

(defun revert-all-files ()
  "Revert all buffers that are visiting a file."
  (interactive)
  (let ((buffers (buffer-list)))
    (while buffers
      (switch-to-buffer (car buffers))
      (revert-buffer t t t)
      (setq buffers (cdr buffers)))))

(defun out-println (arg)
  "Inser out.println statement."
  (interactive "p")
  (insert-string "out.println(\"\");")
  (backward-char 3))

(defun ios ()
  "Insert iostream."
  (interactive)
  (insert-string "#include <iostream>")
  (newline-and-indent)
  (newline-and-indent)
  (insert-string "using namespace std;")
  (newline-and-indent)
  (newline-and-indent))
  
(defun split-c++-string ()
  "Split C++ string."
  (interactive)
  (insert-string "\"")
  (newline-and-indent)
  (insert-string "\""))

(defun split-windows ()
  "Split window into four."
  (interactive)
  (split-window-horizontally)
  (split-window-vertically)
  (other-window 2)
  (split-window-vertically))

(defun launch-command(title command)
  "Launch an eshell and run a command."
  (interactive)
  (eshell title)
  (insert-string command) 
  (eshell-send-input))

(defun make-all-oneline ()
  "Make all one line."
  (interactive)
  (next-line 1)
  (delete-indentation)
  (delete-char 1)
  (next-line 1)
  (make-all-oneline))


(defun switch-to-eshell ()
  "Switch to eshell."
  (interactive)
  (switch-to-buffer "*eshell*"))


(defun eshell-it ()
  "Start eshell."
  (interactive)
  (switch-to-buffer (eshell 1))
  (insert-string "tcsh") 
  (eshell-send-input)
  (insert-string "setenv TERM")
  (eshell-send-input))


(defun send-command(cmd)
  "Send a command to a shell."
  (interactive)
  (insert-string cmd)
  (comint-send-input))
  
(defun mylogin (machine)
  "Login to remote machine."
  (interactive)
  (rlogin machine)
  (send-command "t")
  (send-command "setenv TERM"))

(defun login-test3207 ()
  "Login to test3207"
  (interactive)
  (mylogin "test3207"))

  
(defun login-test3164 ()
  "Login to test3164"
  (interactive)
  (mylogin "test3164"))

(defun login-test1398 ()
  "Login to test1398"
  (interactive)
  (mylogin "test1398"))

(defun qa ()
  "Login to test qa machine test1056"
  (interactive)
  (mylogin "test1056"))

(defun uat ()
  "Login to test qa machine test1347"
  (interactive)
  (mylogin "test1347"))

(defun prod ()
  "Login to test qa machine test1347"
  (interactive)
  (mylogin "test2161"))

(defun make-perl-hash (start end)
  "Make perl hash the contents of the region"
  (interactive "r")
  (goto-char start)
  (cond ((= (point) end) 0)
        ((< (point) end)
         (insert-string "'")
         (cperl-indent-command)
         (forward-word 1)
         (insert-string "' => '")
         (delete-char 1)
         (end-of-line)
         (insert-string "',")
         (next-line 1)
         (beginning-of-line))))

(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defun make-writable ()
  "Make current buffer writable"
  (interactive)
  (shell-command (concat "chmod +w " buffer-file-name) nil nil)
  (revert-buffer))

(defun a2p ()
  "Print it using a2ps"
  (interactive)
  (shell-command (concat "a2p " buffer-file-name) nil nil))

(defun lines ()
  "Turn on line truncation mode"
  (interactive)
  (setq truncate-lines t))

(defun extract-offer-reqs ()
  "Extract offer reqs"
  (interactive))


(defun ofr ()
  "Start offer server"
  (interactive)
  (shell "ofr")
  (insert-string "stofr")
  (comint-send-input))


(provide 'myemacs)
;;; myemacs.el ends here
