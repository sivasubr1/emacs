;;; load libraries
(load-library "cc-mode")
(load-library "cc-align")
(load         "complete")
(load         "cperl-mode")
(load         "sh-script")
(load         "font-lock")
(load-file    "~/myemacs.el")
(load-file    "~/progs/cscope.el")

(autoload 'cperl-mode "cperl-mode" 
                      "alternate mode for editing Perl programs" t)

(setq cscope-master-info-default
      '("CSCOPE"
        ("cscope" "-l" "-d" "-f"
         "/docs/cscope.out") nil nil)) 

;;; Variable settings

(setq save-abbrevs              t)
(setq case-fold-search          t)
(setq transient-mark-mode       t)
(setq compilation-scroll-output t)
(setq fill-column               75)
(setq scroll-conservatively     1)
(setq auto-fill-mode            t)
(setq c-auto-newline            t)
(setq frame-title-format        "%b")
(setq default-major-mode        'text-mode)
(setq initial-major-mode        'text-mode)
(setq display-time-mode         t)
(setq inhibit-startup-message   t)
(setq mail-signature            t)
(setq list-command-history-max  50)
(setq tool-bar-mode             nil)
(setq menu-bar-mode             nil)
(setq compile-command           "gmake ")
(setq lpr-command               "a2ps")
(setq lpr-switches              '("-P bwp526 --sides=2 -Av -a-100 --margin=5 --chars-per-line=80 --medium=A4dj"))
(setq user-mail-address         "siva0825@gmail.com")
(setq find-grep-options         "-s")
(setq shell-file-name           "/bin/tcsh")
(setq sh-shell-file             "/bin/tcsh -f")
(setq printer-name              "/Canon5020")
(setq default-tab-width         2)
(setq c-basic-offset            2)
(setq-default indent-tabs-mode  nil)
(setq c-default-style           '"k&r")
(setq kill-whole-line           t)
(setq cperl-hairy               t)
(setq display-time-day-and-date t)
(setq truncate-partial-width-windows nil)
(setq sql-user                  "test")
(setq sql-password              "test")
(setq sql-server                "NYQ")
(setq sql-database              "test")

(display-time)

;;; variables
(set-variable 'vc-handled-backends '(SCCS RCS CVS))

;;; alists
(setq auto-mode-alist          (append
                                (list (cons "\\.h$"  'c++-mode))
                                auto-mode-alist))
(setq initial-frame-alist      '((width . 80)
                                 (font . "*-fixed-*-*-*-18-*")
                                 (background-color . "black")
                                 (foreground-color . "white")
                                 (height . 26)))
(setq default-frame-alist      '((width . 80)
                                 (font . "*-fixed-*-*-*-18-*")
                                 (background-color . "black")
                                 (foreground-color . "white")
                                 (height . 26)))
(setq auto-mode-alist (append '(("\\.\\([pP][Llm]\\|al\\)$" . cperl-mode)) 
                              auto-mode-alist))
(setq interpreter-mode-alist (append interpreter-mode-alist '(("miniperl" .
                                                               cperl-mode))))
(setq special-display-buffer-names '("*compilation*" "*Shell Command Output*"))

;;; hooks

(set 'find-file-hooks
     '(lambda()
        (line-number-mode    1)
        (column-number-mode  1)
        (auto-fill-mode      1)
        (font-lock-mode      1)
        (icomplete-mode      1)
        (abbrev-mode         1)))

(set 'shell-mode-hook
     '(lambda()
        (icomplete-mode      1)
        (abbrev-mode         1)))

(set 'c++-mode-hook
     '(lambda()
        (cscope-bind-keys-2deep)
        (setq tab-width 2)))

(set 'c-mode-hook-common-hook
     '(lambda()
        (setq tab-width 2)))
(add-hook 'mail-setup-hook 'mail-abbrevs-setup)
(add-hook 'mail-setup-hook '(lambda() (auto-fill-mode 1)))
(add-hook 'find-file-hooks 'auto-insert)
(add-hook 'write-file-hooks 'time-stamp)

;;; Key bindings
(global-set-key [C-h C-i] 'info)
(global-set-key [f1]      'revert-buffer)
(global-set-key [f2]      'refresh)
(global-set-key [f3]      'exec-buffer)
(global-set-key [f4]      'compile)
(global-set-key [f5]      'write-region)
(global-set-key [f6]      'eshell-it)
(global-set-key [f7]      'goto-line)
(global-set-key [f8]      'split-perl-string)
(global-set-key [f9]      'throws-exception)
(global-set-key [f10]     'split-c++-string)
(global-set-key [S-f1]    'grep)
(global-set-key [S-f2]    'eval-buffer)
(global-set-key [S-f3]    'bracket-region)
(global-set-key [S-f4]    'debug)
(global-set-key [S-f5]    'switch-to-eshell)
(global-set-key [S-f6]    'javamain)
(global-set-key [S-f7]    'refactor-block)
(global-set-key [S-f8]    'print-perl-var)
(global-set-key [S-f9]    'next-error)
(global-set-key [S-f10]   'close-all-files)
(global-set-key [C-f1]    'perl-list-print)
(global-set-key [C-f2]    'break-string)
(global-set-key [C-f3]    'run-buffer)
(global-set-key [C-f4]    'debugc)
(global-set-key [C-f5]    'exception)
(global-set-key [C-f6]    'java-help)
(global-set-key [C-f7]    'print-members)
(global-set-key [C-f8]    'ios)
(global-set-key [C-f9]    'checkout-buffer)
(global-set-key [C-f10]   'getset)
(global-set-key [M-f1]    'split-c++-string)
(global-set-key [M-f2]    'orlog)
(global-set-key [M-f3]    'a2p)
(global-set-key [M-f4]    'refactor-perl-block)
(global-set-key [M-f5]    'register-buffer)
(global-set-key [M-f6]    'revert-buffer)
(global-set-key [M-f10]   'refactored)
(global-set-key "%"       'match-paren)

;;; Registers
(set-register ?y '(file . "~/.emacs"))
(set-register ?z '(file . "~/.tcshrc"))
(set-register ?k '(file . "~/tasks.txt"))


;;; faces
(set-face-foreground 'font-lock-string-face        "dark red")
(set-face-foreground 'font-lock-variable-name-face "lightskyblue1")
(set-face-background 'font-lock-variable-name-face "magenta4")
(set-face-foreground 'font-lock-doc-face           "green")
(set-face-foreground 'font-lock-constant-face      "yellow")
(set-face-foreground 'font-lock-comment-face       "yellow")
(set-face-foreground 'font-lock-builtin-face       "green")
(set-face-foreground 'sh-heredoc-face              "yellow")
(set-face-foreground 'cperl-nonoverridable-face    "ForestGreen")

(define-key global-map [M-S-down-mouse-3] 'imenu)


;;; auto inserts
(setq-default auto-insert-query nil)
(define-auto-insert
  '("\\.sh\\'" . "Bourne shell script")
  '(nil "#!/bin/sh\n\n"
        "# Author:\n"
        "# Time-stamp: <>\n\n"))
(define-auto-insert
  '("\\.pl\\'" . "Perl script")
  '(nil "#!/perl5/bin/perl5.8 -w\n\n# Author: "
        "\n# Time-stamp: <>\n\n"
        "use strict;\n\n"))

(define-auto-insert
  '("\\.java\\'" . "Java Class")
  '(nil "// Author: "
        "\n// Time-stamp: <>\n\n"
        "public class "
        (noext)
        "\n{\n    "
        (noext)
        "()\n    {\n    }\n\n\n"
        "  public static void main(String[] args) "
        "throws Exception\n    {\n"
        "      System.out.println(\""
        (noext)
        " started...\");\n  }\n}\n"
        ))

;;; commands

(fset 'bracket-region
      "\C-x\C-x(\C-x\C-x)")

;;;(load "gnuserv")
;;;(gnuserv-start)
;;;(setq gnuserv-frame (selected-frame))


(fset 'insert-inline
      "\C-s::\C-p\C-p\C-jinline\C-s\C-s\C-n\C-a")


(server-start)
(quietly-read-abbrev-file "~/.abbrev_defs")
;;;(desktop-load-default)
;;;(desktop-read)
(fset 'mo
   "\C-f\C-f\C-d3")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((todo-categories "Todo" "General" "Todo" "Todo")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
