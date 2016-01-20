;;; PROJECTOR-DISPLAY --- Display the Agenda for Meetings
;;
;; Author: Howard Abrams
;; Copyright © 2015, Howard Abrams, all rights reserved.
;; Created: 12 Dec 2015
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;  Run the function, `pdx-display' and it will load or generate an
;;  agenda for displaying the logo and whatnot at a meeting.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change log:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(when (not (require 'use-package nil t))
  (package-install 'use-package))

(use-package demo-it
  :ensure t)


(defun pdx-emacs-display ()
  "Display the PDX Emacs Hackers logo and agenda."
  (interactive)
  (let* ((year (format-time-string "%Y"))
         (month (format-time-string "%m"))
         (day (format-time-string "%d"))
         (file-pattern (format "../meeting-notes/%s-%s\*.org" year month))
         (exist-file (car (file-expand-wildcards file-pattern)))
         (file-name (format "../meeting-notes/%s-%s-%s.org" year month day)))

    (find-file "pdx-emacs.png")
    (demo-it-hide-mode-line)
    (split-window)
    (other-window 1)
    (org-tree-slide-simple-profile)
    (if (file-exists-p exist-file)
        (demo-it-presentation exist-file)
      (demo-it-presentation file-name))))

(pdx-emacs-display)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; projector-display.el ends here
