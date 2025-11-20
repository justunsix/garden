---
filetags: ":emacs:epubnote:"
id: 3630b5e3-7579-42d8-b461-813b36094e53
title: Emacs Windows Management
---

Source: [Demystifying Emacs's Window
Manager](https://www.masteringemacs.org/article/demystifying-emacs-window-manager) -
as of Emacs 28

## Window Management Capabilities

Emacs can be like panelling in modern IDEs. Current functions:

- Grouping Windows - so certain commands that affect one, affect all of
  them. It is called *atomic*. For example, `C-x 0` will delete windows
  of that group.
- Dedicating Windows - locked to a buffer, solves issues where you
  accidentally switch buffers in a window layout
- Sidebars - windows can be attached to left, right, top, and bottom
  that resist switching and splitting.
- Window of buffer placements - can be controlled with variables
  - For example:
    - All python buffers will only open in windows with python mode
    - eshell always is in a new window

## Concepts

- Switching buffers can be manual like with `C-x b` and switch is exempt
  from display action rules you create.

``` elisp
;; Requires Emacs 27+
;; The following snippet will treat manual buffer switching
;; the same as programmatic switching to avoid manual switch overriding your display action rules.
;; https://www.masteringemacs.org/article/demystifying-emacs-window-manager
(setq switch-to-buffer-obey-display-actions t)
```

- `display-buffer` will determine where your buffer and window goes
  - If set up right, all displays of buffers should go through
    `display-buffer`
  - It check where things go by checking a list of things:
    - `display-buffer-overriding-action` - which is only for Lisp use,
      so not used by us
    - `display-buffer-alist` - a list of rules for Emacs window
      management
    - `ACTION` argument supplied to it, it is more of a conditional
    - `display-buffer-base-action` - a default action, can be used to
      build a catch-all rule for rules that do not match the above ones
    - `display-buffer-fallback-action` - consulted last and only for
      Lisp

Example function:

``` elisp
;; Display a buffer in the same window (same refers to the selected window.)
(defun display-buffer-same-window (buffer alist)
  (unless (or (cdr (assq 'inhibit-same-window alist))
              (window-minibuffer-p)
              (window-dedicated-p))
    (window--display-buffer buffer (selected-window) 'reuse alist)))
```

Asking Emacs to put something in the same window is only possible if:

- inhibit-same-window is not t in ALIST.
- This flag instructs Emacs to never put something in the same window.
- The window is not the minibuffer.
- The window is not dedicated. Dedicated windows resist attempts to
  change their current buffer.

### Constraints

- Example constraints.
  - info and help windows go to sidebar left
  - python buffers reuse existing python windows
  - eshell once shown is dedicate
- Given enough of these constraints, Emacs may have difficulty doing
  your rules and may default to just showing the buffer in a window.

## Trees, Windows, and Internal Windows

- Emacs tracks the current window layout in a tree structure = window
  tree

``` elisp
;; Evaluate this to see the window tree
(window-tree)
```

As a tree grows, evenutally some windows will not be displayed =
internal windows. Internal windows can be useful as parents to do
splitting actions on them like `C-x 2`.

## Splitting Windows

- `C-x 2` - split below
- `C-x 3` - split right

To split below or right of all your other windows:

``` elisp
;; Split all windows below
(defun mp-split-below (arg)
  "Split window below from the parent or from root with ARG."
  (interactive "P")
  (split-window (if arg (frame-root-window)
                  (window-parent (selected-window)))
                nil 'below nil))

;; Split all windows right
(defun mp-split-right (arg)
  "Split window right from the parent or from root with ARG."
  (interactive "P")
  (split-window (if arg (frame-root-window)
                  (window-parent (selected-window)))
                nil 'right nil))
```

## Dedicating Windows

Dedicated windows:

- Makes manual buffer switches, splitting windows give an error
- Emacs will not switch buffers in dedicated windows
- Windows and buffers can still be closed

``` elisp
;; Toggles dedication in the selected window
(defun mp-toggle-window-dedication ()
  (interactive)
  (set-window-dedicated-p (selected-window)
     (not (window-dedicated-p (selected-window)))))
```

- Here the toggle is between `t` or `nil`, but it accepts a range of
  non-nil values. Values like `side` is not as strong a dedication as
  setting it to `t` is.

## Side Windows

- Can be left, top, bottom, or right side of frame.
- More than one side window on a side of a frame is possible
- Can be:
  - `dedicated`
  - Side relative to another side window using `slot`
  - Toggle side window visibility using `M-x window-toggle-side-window`
  - Be reset in case of issues which
    `(set-frame-parameter (selected-frame) 'window-state nil)`

## Controlling Buffer and Window Display

### Recommended settings

Customizations to consider or use:

- `switch-to-buffer-in-dedicated-window`
  - Controls what happens if you, as a user, attempt to switch buffers
    in a dedicated window. (Remember, sidebars are also a form of
    dedicated window.). `pop` by default works to pop up the buffer
    somewhere else instead of erroring out.
- `switch-to-buffer-obey-display-actions` (Emacs 27+ required)
  - If nil, the default, user-switched buffers are exempt from display
    buffer actions set in display-buffer-alist
  - You probably want those rules to affect your interactive buffer
    switching, as it makes for a consistent buffer switching experience.
    Set it to `t` to apply to interactive buffer switches.
  - Note some packages and functions disregard usual settings and use
    switch-to-buffer instead of display-buffer when they want to show a
    buffer to the user. This is wrong. And the net result is that your
    display rules won’t apply if this variable is not set to `t`.

### display-buffer-alist

- To control where a buffer or window appears, customize
  `display-buffer-alist`. When experimenting or starting out, use the
  `M-x customize-option` on `display-buffer-alist` to easily see changes
  and apply changes with `C-c C-c` to test.

- The `display-buffer-alist` is a list of rules that Emacs uses to
  determine where to display a buffer. Each rule is a list of three
  elements:

  - A `REGEXP` (condition) that matches the buffer name, use
    `M-x re-builder` to help build the regexp.
  - A `ACTION` either function or list of functions
    - See possible actions with built in ones
      `C-u C-h a ^display-buffer-[^-]` (then extract to list using Ivy
      occur `C-c C-o`)

    - Example:

      ``` elisp

      ;; Try to reuse existing help window or pop up a new window
      (add-to-list 'display-buffer-alist
         '("\\*Help\\*"
           (display-buffer-reuse-window display-buffer-pop-up-window)))

      ```
  - Optional `ALIST` of flags and settings

For a list of useful `ACTIONS` and `ALIST` settings see [Demystifying
Emacs's Window Manager - Mastering
Emacs](https://www.masteringemacs.org/article/demystifying-emacs-window-manager),
section "Useful ACTION Functions"

## Putting it Together and Examples

``` elisp

;; We match against one buffer name, *Compilation*; with one ACTION, display-buffer-reuse-window; and no ALIST settings, so it’s not listed.
(add-to-list 'display-buffer-alist
             '("\\*Compilation\\*"
               display-buffer-reuse-window))

;; There’s a bit more going on here. I want *info* windows in a side bar window; it must be on the right-hand side
;; and in slot 0; the window-width must be 80; and Emacs must set the window no-delete-other-windows window parameter to t (good for persistent side bars).
(add-to-list 'display-buffer-alist
             '("\\*info\\*"
               (display-buffer-in-side-window)
               (side . right)
               (slot . 0)
               (window-width . 80)
               (window-parameters
                (no-delete-other-windows . t))))

```

## Window Changes, Limitions

- Some packages and internal Emacs packages do not respect the
  `display-buffer-alist` rules. You may need to raise it with the
  maintainer or do workarounds
- Changes:
  - `M-x winner-mode` allows undo (`C-c left`) and redo (`C-c right`)
    window configuration changes
  - `M-x tab-bar-history-forward` and `M-x tab-bar-history-backware`
    cycle changes in the active tab's window layout

## Helper Functions

### Match Buffers

Match buffers against their major modes

``` elisp

(defun make-display-buffer-matcher-function (major-modes)
  (lambda (buffer-name action)
    (with-current-buffer buffer-name (apply #'derived-mode-p major-modes))))

```

- This function returns a lambda function that matches against a list of
  major-modes.
- You can use it in a backquoted form to quickly create a matcher that
  checks if a buffer’s major mode is derived-mode-p from your list of
  major-modes

### Reuse Windows

### Prevent Popup and reuse window

Tells any buffer named **vterm** to reuse a window with a major mode of
vterm-mode or vterm-copy-mode. Changing `inhibit-same-window` to t
prevents Emacs from reusing the selected window if it’s a vterm window
(you’ll instead get a new window.)

``` elisp

(add-to-list 'display-buffer-alist
     '("\\*vterm\\*" display-buffer-reuse-mode-window
       ;; change to `t' to not reuse same window
       (inhibit-same-window . nil)
       (mode vterm-mode vterm-copy-mode)))

```

### Reusing Windows for Certain Purposes

- Collection of buffer names and ask that they share their respective
  buffers’ windows. That is, **xref** always reuses an **xref** window;
  a **grep** buffer a **grep** window, etc.
- One rule to force reuse of an existing windows

``` elisp

(add-to-list 'display-buffer-alist
          `(,(rx (| "*xref*"
                    "*grep*"
                    "*Occur*"))
            display-buffer-reuse-window
            (inhibit-same-window . nil)))

```

### Match by Major mode

- A common need is matching against one or more major modes, but not
  possible to match against the buffer name.
- Consider Magit that has a large range of buffer names and major modes.

``` elisp

;; Required. But note that this _does_ change Magit's default buffer display behavior.
(setq magit-display-buffer-function #'display-buffer)

(add-to-list 'display-buffer-alist
          `(,(make-display-buffer-matcher-function '(magit-mode))
            (display-buffer-reuse-mode-window
             display-buffer-in-direction)
            (mode magit-mode)
            (window . root)
            (window-width . 0.15)
            (direction . left)))

```

- Force magit to reuse any magit-mode-derived buffer window already
  present.
- If there is no such buffer, Emacs will instead create a window in the
  left-most direction with a width of 15% of the frame for all
  magit-mode-derived modes.

### Hide Buffers

- Do not show a window at all if it matches a buffer pattern
- Useful for buffers that only need to be visited for problems or
  certain situations

``` elisp

(add-to-list 'display-buffer-alist
   '("\\*compilation\\*" display-buffer-no-window
     (allow-no-window . t)))

```

## IDE-style Windows

### Terminal at Bottom

- Force Emacs to place them at the bottom, with a window height of no
  more than 30% of the size of the frame

``` elisp

(add-to-list 'display-buffer-alist
  '("\\*e?shell\\*" display-buffer-in-direction
    (direction . bottom)
    (window . root)
    (window-height . 0.3)))

```

### Side Windows

- Recommend you limit the number of side window slots – `nil` means
  infinite, and a positive number the maximum you’ll allow – as that
  means Emacs swaps out the buffer in that slot instead of creating a
  new entry.
- Good for temporary buffers like compilation, test output, shell
  command output, etc. – that you want to share windows.
- Recommend set a window parameter, `no-delete-other-windows`, that
  prevents Emacs from destroying the side window when you type C-x 1. It
  also has a fixed size of 80.

``` elisp

;; left, top, right, bottom
(setq window-sides-slots '(0 0 1 0))

(add-to-list 'display-buffer-alist
             `(,(rx (| "*compilation*" "*grep*"))
               display-buffer-in-side-window
               (side . right)
               (slot . 0)
               (window-parameters . ((no-delete-other-windows . t)))
               (window-width . 80)))

;; toggle visibility wwith M-x window-toggle-side-windows

;; Snippet places a buffer to the immediate right of the current window if the buffer name starts with test_ or test-.
;; Example, used for header files in C / C++

(add-to-list 'display-buffer-alist
             `("^test[-_]"
               display-buffer-in-direction
               (direction . right)))

```

### Tabs

- Using `tab-bar-mode`
- Recommend customize `tab-bar-format` and change so you show formatted
  groups

1.  Grouping Buffers into a named tab

    1.  Tab for just org files

        ``` elisp

        (add-to-list 'display-buffer-alist
                  `(,(make-display-buffer-matcher-function '(org-mode org-agenda-mode))
                    (display-buffer-in-tab display-buffer-in-direction)
                    (ignore-current-tab . t)
                    (direction . bottom)
                    (window-height . .2)
                    (tab-name . "🚀 My ORG Mode Files")
                    ;; Optional
                    (tab-group . "Org")))

        ```

        - A tab called 🚀 My Org Mode Files. If the tab does not exist,
          it is first created.
        - If you leave out tab-name Emacs will instead auto-generate it.
          That’ll generate lots of new tabs
        - The tab-group Org is also set up if it does not exist. The
          group is optional and is not a requirement.
        - If the buffer Emacs is displaying is already visible in a
          window in that tab bar, then Emacs stops the search. However,
          if it is not, Emacs will continue with the search and apply
          display-buffer-in-direction in that tab.
        - The new window is given a height of 20%.

    2.  Tabs for Projects

        - Tab group for each project – as defined by `C-x p p` and
          Emacs’s project management implementation and with each buffer
          getting its own tab. Buffers without projects are ignored.
        - Requires changes to work for your workflow

        ``` elisp

        (defun mp-buffer-has-project-p (buffer action)
          (with-current-buffer buffer (project-current nil)))

        (defun mp-tab-group-name (buffer alist)
          (with-current-buffer buffer (concat "🗃 " (or (cdr (project-current nil)) "🛡 Ungrouped"))))

        (defun mp-tab-tab-name (buffer alist)
          (with-current-buffer buffer
            (buffer-name)))

        (add-to-list 'display-buffer-alist
                     '(mp-buffer-has-project-p
                       (display-buffer-in-tab display-buffer-reuse-window)
                       (tab-name . mp-tab-tab-name)
                       (tab-group . mp-tab-group-name)))

        ;;; OPTIONAL, but probably required for everything to work 100%
        (defun tab-bar-tabs-set (tabs &optional frame)
          "Set a list of TABS on the FRAME."
          (set-frame-parameter frame 'tabs (seq-sort-by (lambda (el) (alist-get 'group el nil))
                                                        #'string-lessp
                                                        tabs)))

        (defun mp-reload-tab-bars (&optional dummy)
          "Reload the tab bars... because they're buggy."
          (interactive)
          (tab-bar-tabs-set (frame-parameter nil 'tabs)))

        (add-hook 'kill-buffer-hook #'mp-reload-tab-bars)
        (add-hook 'window-selection-change-functions #'mp-reload-tab-bars)

        ```
