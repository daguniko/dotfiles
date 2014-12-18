;;python jedi setting
(add-to-list 'load-path "~/.emacs.d/site-lisp/jedi/emacs-deferred/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/jedi/emacs-epc/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/jedi/emacs-ctable/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/jedi/emacs-jedi/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "/Users/sudo/.emacs.d/elpa/python-environment-20140321.1116")
(require 'auto-complete-config)
(require 'python)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(add-hook 'python-mode-hook 'jedi:setup)
;;これを入れるとjediを手動<C-tab>で立ち上げないといけない。
;(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)


;;C-aで行頭とインデント行き来
(global-set-key "\C-a" 'beginning-of-indented-line)
(defun beginning-of-indented-line (current-point)
  (interactive "d")
  (if (string-match
       "^[ \t]+$"
       (save-excursion
         (buffer-substring-no-properties
          (progn (beginning-of-line) (point))
          current-point)))
      (beginning-of-line)
    (back-to-indentation)))

;; Google 日本語入力
;;[<65;30;39M
(setq default-input-method "MacOSX")
(mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `title "あ")


;;helm binding
(define-key global-map (kbd "C-s")  'helm-swoop)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;;(global-set-key (kbd "C-x b") 'helm-buffers-list)
;;(global-set-key (kbd "M-z") 'helm-resume)

;; バッファの切り替えを helm に変更
(global-set-key (kbd "C-x C-b") 'helm-mini)

;; binding for forward,backward list
(global-set-key (kbd "M-p") 'backward-list)
(global-set-key (kbd "M-n") 'forward-list)

;; ;; helm-setting
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/helm")
;; (load "helm.el")
;; (require ‘helm-config)

;; cua-modeの設定
(setq cua-enable-cua-keys nil)  ; CUAキーバインドを無効化

;; LOADPATHからlinum.elの読み込み
(setq load-path (cons "~/.emacs.d/orig-lisp" load-path))
(setq load-path (cons "~/.emacs.d/site-lisp" load-path))
(load "linum")
(load "popwin")

;; linumの設定
(require 'linum)
(setq linum-format "%5d ")
(global-linum-mode 1)

;; mouse-scroll setting (for beginner)
(global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
(global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1)))
(unless (fboundp 'track-mouse)
  (defun track-mouse (e)))
(xterm-mouse-mode t)
(require 'mouse)
(require 'mwheel)
(mouse-wheel-mode t)

;;define half-page-up,down
(defun half-page-up () "カーソルは画面内固定で半画面 scroll-up。"
  (interactive)
  (if(= (window-end) (point-max))
      (next-line (/ (window-height) 2))
    (let ((a (line-number-at-pos)))
      (if(< a 1) (setq a 1))
      (scroll-up (/ (window-height) 2))
      (move-to-window-line a)
      )))

(defun half-page-down ()  "カーソルは画面内固定で半画面 scroll-down。"
  (interactive)
  (if(= (window-start) 1)
      (next-line (/ (window-height) -2))
    (let ((a (line-number-at-pos)))
      (scroll-down (/ (window-height) 2))
      (move-to-window-line a)
      )))

;;key bind for half scroo up down 
;;本当はC-dにセットしたかったけど、なぜかunbindできないので、C-qにおいた。
(global-unset-key "\C-d")
(global-set-key "\C-q" 'half-page-up)
(global-set-key "\C-u" 'half-page-down)

;短形選択モード(sense-rigion)
;; 矩形選択を簡単に
;;(require 'sense-region)
;;(sense-region-on)

;;emacs + tmux + macでクリップボードの連携
;; (defun copy-from-osx ()
;;  (shell-command-to-string "pbpaste"))

;; (defun paste-to-osx (text &optional push)
;;  (let ((process-connection-type nil))
;;      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;;        (process-send-string proc text)
;;        (process-send-eof proc))))

;; (setq interprogram-cut-function 'paste-to-osx)
;; (setq interprogram-paste-function 'copy-from-osx)

;;emacsの起動時の画面を消す
;;(setq inhibit-startup-message t)
;;(setq initial-scratch-message nil)


;;バックスラッシュキーの設定
(define-key global-map [?¥] [?\\])

;;バックスペースキーの設定
;(global-set-key "\C-h" 'delete-backward-char)
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)
(global-set-key "\C-ch" 'help-command)

;;Emacsが保持するterminfoを利用する
(setq system-uses-terminfo nil)

;; ロードパスを設定
;; (add-to-list 'load-path "~/.emacs.d/elisp/")
;;(setq load-path (cons "~/.emacs.d/site-lisp" load-path))
;; C-c g で指定した行へ移動
(global-set-key "\C-xg" 'goto-line)

;; リポジトリを拡張
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; popwin.el を導入
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)


;; モードラインに Git のブランチを表示
;; http://d.hatena.ne.jp/syohex/20130201/1359731697 から拝借
(let ((cell (or (memq 'mode-line-position mode-line-format)
		(memq 'mode-line-buffer-identification mode-line-format)))
      (newcdr '(:eval (my/update-git-branch-mode-line))))
  (unless (member newcdr mode-line-format)
    (setcdr cell (cons newcdr (cdr cell)))))

(defun my/update-git-branch-mode-line ()
  (let* ((branch (replace-regexp-in-string
                  "[\r\n]+\\'" ""
                  (shell-command-to-string "git symbolic-ref -q HEAD")))
         (mode-line-str (if (string-match "^refs/heads/" branch)
                            (format "[%s]" (substring branch 11))
                          "[Not Repo]")))
    (propertize mode-line-str
                'face '((:foreground "red" :weight bold)))))

;; メニューバーを表示しない
(menu-bar-mode -1)

;; カーソルの位置（行）を表示
(line-number-mode 1)

;; カーソルの位置（列）を表示
(column-number-mode 1)

;; 対応する括弧をハイライト
(show-paren-mode 1)

;; 選択領域に色を付与
(set-face-background 'region "#555")

;; 行末に無駄なスペースがあれば、色を付与
(setq-default show-trailing-whitespace 1)
(set-face-background 'trailing-whitespace "red")




;; M-p で history-beginning-search
(add-hook 'shell-mode-hook
	  '(lambda ()
	     (local-set-key "\M-p" 'comint-previous-matching-input-from-input)
	     ))
;; org-mode で "Validate XHTML 1.0" を表示しない
(setq org-export-html-validation-link -1)
;;

;; マジックコメントの自動挿入を無効化
(setq ruby-insert-encoding-magic-comment nil)

;; ;; テーマを設定
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-enabled-themes (quote (manoj-dark))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
;; (put 'set-goal-column 'disabled nil)





;;helm-git-project
(defun helm-c-sources-git-project-for (pwd)
  (loop for elt in
        '(("Modified files" . "--modified")
          ("Untracked files" . "--others --exclude-standard")
          ("All controlled files in this project" . nil))
        for title  = (format "%s (%s)" (car elt) pwd)
        for option = (cdr elt)
        for cmd    = (format "git ls-files %s" (or option ""))
        collect
        `((name . ,title)
          (init . (lambda ()
                    (unless (and (not ,option) (helm-candidate-buffer))
                      (with-current-buffer (helm-candidate-buffer 'global)
                        (call-process-shell-command ,cmd nil t nil)))))
          (candidates-in-buffer)
          (type . file))))

(defun helm-git-project-topdir ()
  (file-name-as-directory
   (replace-regexp-in-string
    "\n" ""
    (shell-command-to-string "git rev-parse --show-toplevel"))))

(defun helm-git-project ()
  (interactive)
  (let ((topdir (helm-git-project-topdir)))
    (unless (file-directory-p topdir)
      (error "I'm not in Git Repository!!"))
x1    (let* ((default-directory topdir)
           (sources (helm-c-sources-git-project-for default-directory)))
      (helm-other-buffer sources "*helm git project*"))))

(global-set-key (kbd "C-x C-g") 'helm-git-project)
