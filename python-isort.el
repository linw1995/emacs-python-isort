;;; python-isort.el --- Utility to sort Python imports -*- lexical-binding: t; -*-

;; Author: 林玮 (Jade Lin) <linw1995@icloud.com>
;; Keywords: languages
;; URL: https://github.com/linw1995/emacs-python-isort
;; Package-Requires: ((emacs "27") (reformatter "0.3"))
;; Version: 1.0.0

;; Copyright 2020 林玮 (Jade Lin). Licensed under the 3-Clause BSD License.

;;; Commentary:

;; Commands for sorting Python imports via isort.

;;; Code:

(require 'python)
(require 'reformatter)

(defgroup python-isort nil
  "Utility to sort Python imports"
  :group 'python
  :prefix "python-isort-")

(defcustom python-isort-command "isort"
  "Name of the `isort` executable."
  :group 'python-isort
  :type 'string)

(defvar python-isort--base-args '("--quiet" "--atomic")
  "Base arguments to pass to isort.")

(defcustom python-isort-extra-args nil
  "Extra arguments to pass to isort."
  :group 'python-isort
  :type '(repeat string))

;;;###autoload (autoload 'python-isort-buffer "python-isort" nil t)
;;;###autoload (autoload 'python-isort-region "python-isort" nil t)
;;;###autoload (autoload 'python-isort-on-save-mode "python-isort" nil t)
(reformatter-define python-isort
  :program python-isort-command
  :args (python-isort--make-args beg end)
  :lighter " isort"
  :group 'python-isort)

(defun python-isort--make-args (beg end)
  "Helper to build the argument list for isort for span BEG to END."
  (append python-isort--base-args
          python-isort-extra-args
          '("-")))

(provide 'python-isort)
;;; python-isort.el ends here
