;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; 3. Checkers
     spell-checking
     syntax-checking
     ;; 4. Completion
     auto-completion
     compleseus
     ;; 6. Emacs
     better-defaults
     tabs
     ;; helpful
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     org
     ;; 7. File trees
     (treemacs :variables treemacs-use-all-the-icons-theme t)
     ;; 10. Internationalization
     ;; japanese
     ;; 11. Miscellaneous
     multiple-cursors
     ;; 15. Programming languages
     (clojure :variables clojure-enable-linters 'clj-kondo)
     emacs-lisp
     csv
     html
     ;; react
     (json :variables
           json-fmt-tool 'prettier
           json-fmt-on-save t
           json-backend 'lsp)
     (markdown :variables markdown-live-preview-engine 'vmd)
     (yaml :variables yaml-enable-lsp t)
     toml
     graphql
     sql
     (javascript :variables
                 javascript-fmt-tool 'prettier
                 javascript-fmt-on-save t
                 javascript-import-tool 'import-js)
     ;; npm install -g typescript eslint babel-eslint eslint-plugin-react prettier
     (typescript :variables
                 typescript-fmt-tool 'prettier
                 typescript-fmt-on-save t)
     ;; 18. Source control
     (git :variables
          git-magit-status-fullscreen t
          git-enable-magit-delta-plugin t
          git-enable-magit-todos-plugin t
          )
     version-control
     ;; 22. Tools
     docker
     ;; npm install -g import-js
     import-js
     ;; Installed servers: ts-ls, tailwindcss, eslint, clojure-lsp
     (lsp :variables
          lsp-lens-enable t
          lsp-modeline-diagnostics-scope 'file
          lsp-ui-remap-xref-keybindings t)
     (tree-sitter :variables
                  tree-sitter-syntax-highlight-enable t
                  tree-sitter-fold-enable t
                  tree-sitter-fold-indicators-enable nil)
     vim-empty-lines
     ;; 24. Web services
     github-copilot
     (shell :variables
            shell-scripts-format-on-save t
            shell-default-height 30
            shell-default-position 'bottom)
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages
   '(catppuccin-theme
     evil-goggles
     lsp-tailwindcss
     mozc
     mozc-popup
     (cljstyle-mode :location (recipe :fetcher github :repo "jstokes/cljstyle-mode"))
     jtsx)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024 5)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(catppuccin
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   ;dotspacemacs-mode-line-theme 'spacemacs
   ;dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
   dotspacemacs-mode-line-theme 'doom
   ;dotspacemacs-mode-line-theme 'all-the-icons

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Han Code JP"
                               :size 12.0
                               :weight semi-light
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.1

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 80

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%t %a"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
)

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
)


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
)


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (set-language-environment "Japanese")
  (prefer-coding-system 'utf-8)
  (set-clipboard-coding-system 'utf-8)
  (setq x-select-enable-clipboard t)

  ;; My functions

  (defun enable-input-method (&optional arg interactive)
    (interactive "P\np")
    (if (not current-input-method)
        (toggle-input-method arg interactive)))

  (defun disable-input-method (&optional arg interactive)
    (interactive "P\np")
    (if current-input-method
        (toggle-input-method arg interactive)))

  (defun my/escape ()
    (interactive)
    (disable-input-method nil t)
    (evil-normal-state))

  ;; Package customize

  (use-package evil
    :defer t
    :custom (evil-move-beyond-eol t)
    :config
    (define-key evil-normal-state-map (kbd "H") (kbd "^"))
    (define-key evil-normal-state-map (kbd "L") (kbd "$"))
    (define-key evil-normal-state-map (kbd "Y") (kbd "y $"))
    (bind-keys :map evil-insert-state-map
               ("C-j" . toggle-input-method))
    (bind-key "<escape>" 'my/escape evil-insert-state-map))

  (use-package evil-escape
    :after evil
    :custom
    (evil-escape-key-sequence "jk")
    (evil-escape-delay 0.2))

  (use-package evil-goggles
    :after evil
    :custom (evil-goggles-duration 0.05)
    :config
    (evil-goggles-mode)
    (evil-goggles-use-diff-faces))

  (use-package expand-region
    :bind (("C-=" . er/expand-region)
           ("C--" . er/contract-region)))

  (use-package catppuccin-theme
    :defer t
    :init
    ;; frappe, latte, macchiato, mocha
    (setq catppuccin-flavor 'mocha))

  (use-package mozc
    :custom
    (default-input-method "japanese-mozc"))

  ;; 書いているとフレームが下にずれていく問題が発生している
  (use-package mozc-popup
    :defer t
    :after mozc
    :config
    (setq mozc-candidate-style 'popup))

  (use-package consult
    :defer t
    :config
    ;; Spacemacsのデフォルトだと(setq consult-preview-key '("M-." "C-SPC"))だが全体で機能させたいのでanyに変更
    (setq consult-preview-key 'any))

  (use-package centaur-tabs
    :defer t
    :custom ((centaur-tabs-style "alternate")
             (centaur-tabs-set-icons t)
             (centaur-tabs-set-modified-marker t))
    :bind (:map evil-normal-state-map
                ("C-<tab>" . centaur-tabs-forward)
                ("C-<iso-lefttab>" . centaur-tabs-backward)
                ("C-w" . kill-current-buffer))
    :config
    (centaur-tabs-group-by-projectile-project))

  (use-package lsp
    :defer t
    :init (setq lsp-enable-symbol-highlighting nil)
    ;; :config
    ;; (spacemacs/lsp-define-extensions "c-c++" 'refs-address
    ;;                                  "textDocument/references"
    ;;                                  '(plist-put (lsp--text-document-position-params) :context '(:role 128)))
    )

  (use-package lsp-tailwindcss
    :defer t
    :init (setq lsp-tailwindcss-add-on-mode t))

  (use-package company
    :defer t
    :config
    ;; disable inline previews
    (delq 'company-preview-if-just-one-frontend company-frontends))

  (use-package copilot
    :defer t
    :hook (prog-mode)
    :custom (copilot-indent-offset-warning-disable t)
    :config
    (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
    (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
    (define-key copilot-completion-map (kbd "C-TAB") 'copilot-accept-completion-by-word)
    (define-key copilot-completion-map (kbd "C-<tab>") 'copilot-accept-completion-by-word))

  (use-package paredit
    :defer t
    :hook ((emacs-lisp-mode . paredit-mode)
           (clojure-mode . paredit-mode)
           (clojurescript-mode . paredit-mode))
    :config
    (define-key paredit-mode-map (kbd "C-j") nil))

  (use-package auto-highlight-symbol
    :defer t
    :custom-face
    ;; catppuccin-mocha-colorsのbase #1e1e2e を基準として1段階Tintしている
    (ahs-face ((t (:foreground "GhostWhite" :background "#343442"))))
    (ahs-plugin-whole-buffer-face ((t (:foreground "GhostWhite" :background "#343442"))))
    :hook ((prog-mode . auto-highlight-symbol-mode)
           (markdown-mode . auto-highlight-symbol-mode)))

  (use-package clojure-mode
    :defer t
    :hook (cljstyle-mode))

  (use-package jtsx
    :defer t
    :mode (("\\.tsx\\'" . jtsx-tsx-mode))
    :commands jtsx-install-treesit-language
    :hook ((jtsx-tsx-mode . hs-minor-mode)
           (jtsx-tsx-mode . lsp)
           (jtsx-tsx-mode . emmet-mode)
           (jtsx-tsx-mode . spacemacs/typescript-yasnippet-setup)
           (jtsx-tsx-mode . spacemacs/typescript-fmt-before-save-hook))
    :custom
    ((js-indent-level 2)
     (typescript-ts-mode-indent-offset 2)
     (jtsx-switch-indent-offset 0)
     (jtsx-indent-statement-block-regarding-standalone-parent nil)
     (jtsx-jsx-element-move-allow-step-out t)
     (jtsx-enable-jsx-electric-closing-element t)
     (jtsx-enable-electric-open-newline-between-jsx-element-tags t)
     (jtsx-enable-jsx-element-tags-auto-sync t)
     (jtsx-enable-all-syntax-highlighting-features t))
    :init
    (add-to-list 'spacemacs--import-js-modes (cons 'jtsx-tsx-mode 'jtsx-tsx-mode-hook))
    (import-js/init-import-js)
    :config
    (defun jtsx-bind-keys-to-mode-map (mode-map)
      "Bind keys to MODE-MAP."
      (define-key mode-map (kbd "C-c C-j") 'jtsx-jump-jsx-element-tag-dwim)
      (define-key mode-map (kbd "C-c j o") 'jtsx-jump-jsx-opening-tag)
      (define-key mode-map (kbd "C-c j c") 'jtsx-jump-jsx-closing-tag)
      (define-key mode-map (kbd "C-c j r") 'jtsx-rename-jsx-element)
      (define-key mode-map (kbd "C-c <down>") 'jtsx-move-jsx-element-tag-forward)
      (define-key mode-map (kbd "C-c <up>") 'jtsx-move-jsx-element-tag-backward)
      (define-key mode-map (kbd "C-c C-<down>") 'jtsx-move-jsx-element-forward)
      (define-key mode-map (kbd "C-c C-<up>") 'jtsx-move-jsx-element-backward)
      (define-key mode-map (kbd "C-c C-S-<down>") 'jtsx-move-jsx-element-step-in-forward)
      (define-key mode-map (kbd "C-c C-S-<up>") 'jtsx-move-jsx-element-step-in-backward)
      (define-key mode-map (kbd "C-c j w") 'jtsx-wrap-in-jsx-element)
      (define-key mode-map (kbd "C-c j u") 'jtsx-unwrap-jsx)
      (define-key mode-map (kbd "C-c j d") 'jtsx-delete-jsx-node))
    (defun jtsx-bind-keys-to-jtsx-tsx-mode-map ()
      (jtsx-bind-keys-to-mode-map jtsx-tsx-mode-map)
      ;; evil-matchitの変わりに設定
      (define-key evil-normal-state-map (kbd "%") 'jtsx-jump-jsx-element-tag-dwim))
    (add-hook 'jtsx-tsx-mode-hook 'jtsx-bind-keys-to-jtsx-tsx-mode-map))

  ;; WSL2で実行しているときにURLをWindowsのブラウザで開けるようにする
  (when (and (eq system-type 'gnu/linux)
             (string-match
              "Linux.*Microsoft.*Linux"
              (shell-command-to-string "uname -a")))
    (setq
     browse-url-generic-program  "/mnt/c/Windows/System32/cmd.exe"
     browse-url-generic-args     '("/c" "start")
     browse-url-browser-function #'browse-url-generic))

  ;; npm install -g vmd
  ;; (WSL) sudo apt install libxss1
  (use-package markdown-mode
    :defer t
    :mode (("\\.md\\'" . gfm-mode)))

  (use-package markdown-toc
    :defer t
    :after markdown-mode
    :custom ((markdown-toc-list-item-marker "-")
             (markdown-toc-header-toc-start "<!-- TOC start -->")
             (markdown-toc-header-toc-end "<!-- TOC end -->")
             (markdown-toc-header-toc-title "")
             (markdown-toc-indentation-space 2)))

  ;; END of user-config
)


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(package-selected-packages
   '(toml-mode jtsx mozc-im magit-delta magit-todos ts-fold fringe-helper treesit-auto spaceline-all-the-icons memoize doom-modeline shrink-path nerd-icons yasnippet consult embark ace-jump-helm-line helm-ag helm-comint helm-descbinds helm-make helm-mode-manager helm-org helm-projectile helm-purpose helm-swoop helm-themes helm-xref helm wfnames helm-core vi-tilde-fringe yasnippet-snippets yaml-mode ws-butler writeroom-mode winum window-purpose which-key wgrep web-mode web-beautify volatile-highlights vmd-mode vim-powerline vim-empty-lines-mode vertico uuidgen unfill undo-tree typescript-mode treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil treemacs-all-the-icons tree-sitter-langs toc-org term-cursor tagedit symon symbol-overlay string-inflection string-edit-at-point sql-indent spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc smeargle slim-mode scss-mode sass-mode restart-emacs request rainbow-delimiters quickrun pug-mode prettier-js popwin pcre2el password-generator paradox pangu-spacing overseer orgit-forge org-superstar org-rich-yank org-projectile org-present org-pomodoro org-mime org-download org-contrib org-cliplink orderless open-junk-file npm-mode nodejs-repl nameless mwim multi-line mozc-popup markdown-toc marginalia macrostep lsp-ui lsp-treemacs lsp-tailwindcss lsp-origami lorem-ipsum livid-mode link-hint json-reformat json-navigator json-mode js2-refactor js-doc japanese-holidays inspector info+ indent-guide import-js impatient-mode ibuffer-projectile hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt graphql-mode google-translate golden-ratio gnuplot gitignore-templates git-timemachine git-modes git-messenger git-link gh-md flyspell-correct-popup flycheck-pos-tip flycheck-package flycheck-elsa flycheck-clj-kondo flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor-ja evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu emr emmet-mode embark-consult elisp-slime-nav elisp-def dumb-jump drag-stuff dotenv-mode dockerfile-mode docker dired-quick-sort diminish diff-hl devdocs define-word ddskk csv-mode copilot consult-yasnippet consult-lsp compleseus-spacemacs-help company-web column-enforce-mode clojure-snippets cljstyle-mode clean-aindent-mode cider-eval-sexp-fu cider centered-cursor-mode catppuccin-theme browse-at-remote avy-migemo auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent ace-link)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed)))))
)
