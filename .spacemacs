;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     php
     (go :variables
         go-use-gometalinter t
         gofmt-command "goimports"
         go-tab-width 4)
     swift
     ruby
     shell-scripts
     (javascript :variables
                 javascript-disable-tern-port-files nil
                 tern-command '("node" "/usr/local/bin/tern"))
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence "jk"
                      auto-completion-complete-with-key-sequence-delay 0
                      auto-completion-private-snippets-directory nil)
     better-defaults
     emacs-lisp
     git
     (gtags :variables gtags-enable-by-default t)
     (markdown :variables markdown-live-preview-engine 'vmd)
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; version-control
     (clojure :variables
              clojure-enable-fancify-symbols t)
     python
     sql
     nginx
     html
     yaml
     csv
     lua
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(ac-php
                                      company-php)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Monaco"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 100
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; Use aspell to check spell
  (setq ispell-program-name "aspell")

  ;; Fix to use stable packages
  (add-to-list 'configuration-layer--elpa-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

  ;; Make stable-pkgs install from melpa-stable
  (let ((stable-pkgs (list 'cider 'projectile 'helm-projectile 'ac-php 'meghanada)))
    (dolist (pkg stable-pkgs)
      (add-to-list 'package-pinned-packages '(pkg . "melpa-stable") t)))

  ;; Make Magit status fullscreen
  (setq-default git-magit-status-fullscreen t))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Make C-h Backspace
  (define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

  ;; Improve frame title
  (setq frame-title-format
        '("emacs " emacs-version (buffer-file-name " - %f")))

  ;; 論理行 (画面上の改行)単位ではなく物理行 (改行文字まで)単位で移動する
  (setq line-move-visual nil)

  (bind-key "C-S-k" 'just-one-space)

  ;; expand-region
  (bind-key "C-=" 'er/expand-region)
  (bind-key "C-M-=" 'er/contract-region)

  ;; Split and move window
  (defun other-window-or-split ()
    (interactive)
    (when (one-window-p)
      (split-window-horizontally))
    (other-window 1))
  (bind-key* "C-t" 'other-window-or-split)

  ;; helm keybinds
  (bind-key "C-c o" 'spacemacs/helm-swoop-region-or-symbol)
  (bind-key "C-;" 'helm-recentf)
  (bind-key "M-y" 'helm-show-kill-ring)
  (bind-key "C-c s" 'helm-ag)
  (bind-key "C-c C-s" 'helm-do-ag-project-root)

  ;; diredを2つのウィンドウで開いている時に、デフォルトの移動orコピー先をもう一方のdiredで開いているディレクトリにする
  (setq dired-dwim-target t)
  ;; ディレクトリを再帰的にコピーする
  (setq dired-recursive-copies 'always)
  ;; diredバッファでC-sした時にファイル名だけにマッチするように
  (setq dired-isearch-filenames t)

  ;; dired-x to make C-x C-j open current directory
  (use-package dired-x)

  ;; Cleanup buffer
  (defun my/cleanup-buffer ()
    (interactive)
    (untabify (point-min) (point-max))
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max)))

  ;; Emacs lisp layer
  (defun my/emacs-lisp-mode-hooks ()
    (add-hook 'emacs-lisp-mode-hook #'my/cleanup-buffer))
  (add-hook 'emacs-lisp-mode-hook #'my/emacs-lisp-mode-hooks)
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)

  ;; Clojure layer
  (defun my/clojure-mode-hooks ()
    ;; (add-hook 'before-save-hook 'my/cleanup-buffer)
    (define-clojure-indent
      (facts 'defun)
      (fact 'defun)
      (letk 'let)))

  (defun my/cider-mode-hooks ()
    (setq nrepl-log-messages t
          cider-repl-display-in-current-window t
          cider-repl-use-clojure-font-lock t
          cider-save-file-on-load t
          cider-font-lock-dynamically '(macro core function var)
          cider-overlays-use-font-lock t)
    (bind-key "C-M-i" 'company-complete cider-mode-map)
    (bind-key "C-M-k" 'paredit-forward-slurp-sexp cider-mode-map))

  (add-hook 'clojure-mode-hook 'my/clojure-mode-hooks)
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook 'aggressive-indent-mode)
  (add-hook 'cider-mode-hook 'my/cider-mode-hooks)

  ;; Go
  (use-package go-mode
    :config
    (bind-key "C-'" 'company-complete go-mode-map)
    (bind-key "M-." 'godef-jump go-mode-map)
    (bind-key "M-," 'pop-tag-mark go-mode-map))

  ;; JavaScript
  (use-package js2-mode
    :config
    (setq-default js2-basic-offset 2)
    (setq-default js-indent-level 2))

  ;; PHP
  (defun my/php-mode-hook ()
    (use-package company-php
      :config
      (ac-php-core-eldoc-setup) ;; enable eldoc
      (make-local-variable 'company-backends)
      (add-to-list 'company-backends 'company-ac-php-backend))
    (bind-key "C-i" 'company-complete php-mode-map)
    (bind-key "C-." 'ac-php-find-symbol-at-point php-mode-map)
    (bind-key "C-," 'ac-php-location-stack-back php-mode-map)
    (bind-key "M-p" 'ac-php-show-tip php-mode-map)
    (bind-key "C-c t" 'ac-php-remake-tags php-mode-map))
  (add-hook 'php-mode-hook 'my/php-mode-hook)

  ;; sql layer
  (use-package sql
    :config
    (load-library "sql-indent")
    (sql-set-product "postgres"))

  (use-package sql-indent
    :config
    (setq sql-indent-offset 2))

  ;; html layer
  (defun my/web-mode-hooks ()
    (setq web-mode-markup-indent-offset 2
          web-mode-css-indent-offset 2
          web-mode-code-indent-offset 2
          web-mode-html-offset 2
          web-mode-sql-indent-offset 2
          web-mode-style-padding 1
          web-mode-script-padding 1
          web-mode-block-padding 0
          web-mode-comment-style 2
          web-mode-enable-auto-pairing t
          web-mode-enable-css-colorization t
          web-mode-enable-block-face t
          web-mode-enable-part-face t))
  (add-hook 'web-mode-hook 'my/web-mode-hooks)

  ;; SCSS
  (defun my/scss-mode-hooks ()
    (setq css-indent-offset 2))
  (add-hook 'scss-mode-hook 'my/scss-mode-hooks)

  ;; YAML
  (defun my/yaml-mode-hooks ()
    (remove-hook 'before-save-hook #'my/cleanup-buffer))
  (add-hook 'yaml-mode-hook #'my/yaml-mode-hooks)

  ;; Markdown
  (defun my/markdown-mode-hooks ()
    (remove-hook 'before-save-hook 'my/cleanup-buffer))
  (add-hook 'markdown-mode-hook 'my/markdown-mode-hooks)

  ;; Enable rectangle selection
  (when (cua-mode t)
    ;; CUAキーバインドを無効にする
    (setq cua-enable-cua-keys nil)
    ;; C-RETがC-jになるため、C-c C-SPCに矩形選択モードを割り当て
    (bind-key "C-c C-SPC" 'cua-set-rectangle-mark))

  ;; Mac
  (when (eq system-type 'darwin)
    (setq ns-command-modifier (quote meta))
    (global-set-key (kbd "C-M-¥") 'indent-region)
    ;; デフォルトの文字コード
    (set-default-coding-systems 'utf-8-unix)
    ;; テキストファイル／新規バッファの文字コード
    (prefer-coding-system 'utf-8-unix)
    ;; ファイル名の文字コード
    (use-package ucs-normalize)
    (set-file-name-coding-system 'utf-8-hfs)
    ;; キーボード入力の文字コード
    (set-keyboard-coding-system 'utf-8-unix)
    ;; サブプロセスのデフォルト文字コード
    (setq default-process-coding-system '(undecided-dos . utf-8-unix)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (realgud google-c-style autodisass-java-bytecode meghanada company-emacs-eclim eclim transient ac-php-core xcscope ggtags company-php helm-gtags ac-php phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode parent-mode request flx anzu bind-map pkg-info popup pcre2el flycheck-gometalinter go-guru go-eldoc company-go go-mode swift-mode inf-ruby insert-shebang fish-mode company-shell sesman vmd-mode packed eval-sexp-fu s org-plus-contrib bind-key hydra iedit smartparens highlight evil goto-chg projectile epl helm helm-core avy ghub let-alist async f powerline dash lua-mode csv-mode noflet ensime sbt-mode scala-mode yaml-mode nginx-mode haml-mode web-completion-data pos-tip flycheck sql-indent skewer-mode simple-httpd json-snatcher json-reformat js2-mode flyspell-correct dash-functional tern anaconda-mode pythonic inflections edn multiple-cursors paredit peg cider queue clojure-mode markdown-mode company yasnippet auto-complete gitignore-mode magit magit-popup git-commit with-editor define-word yapfify xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org tagedit spaceline smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder restart-emacs rbenv rake rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pbcopy paradox osx-trash osx-dictionary orgit org-present org-pomodoro org-download org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode minitest markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode launchctl json-mode js2-refactor js-doc info+ indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump diminish diff-hl cython-mode company-web company-tern company-statistics company-anaconda column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby bundler auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(safe-local-variable-values
   (quote
    ((cider-refresh-after-fn . "zou.framework.repl/go")
     (cider-refresh-before-fn . "zou.framework.repl/stop")
     (cider-cljs-lein-repl . "(zou.framework.repl/cljs-repl)")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
