;; mode:-*-emacs-lisp-*-
(setq
 elmo-maildir-folder-dir "~/Maildir"
 
 elmo-imap4-default-server "imap.gmail.com"
 elmo-imap4-default-user "phil@dixon.gen.nz"
 elmo-imap4-default-port '993
 elmo-imap4-default-stream-type 'ssl

 wl-stay-folder-window t
 wl-folder-window-width 25
 
 wl-stmp-posting-server "localhost"
 wl-local-domain "eeepc.dixon.gen.nz"
 wl-message-id-domain "eeepc.dixon.gen.nz"

 wl-from "Phillip Dixon <phil@dixon.gen.nz>"

 wl-default-folder "%INBOX"
 wl-draft-folder "%[Gmail].Drafts"
 wl-trash-folder "%trash"
 wl-spam-folder "%trash"
 wl-queue-folder ".queue"

 ;; hide many fields from message buffers
 wl-message-ignored-field-list '("^.*:")
 wl-message-visible-field-list
 '("^\\(To\\|Cc\\):"
   
   "^Subject:"
   "^\\(From\\|Reply-To\\):"
   "^Organization:"
   "^Message-Id:"
   "^\\(Posted\\|Date\\):"
   )
 wl-message-sort-field-list
 '("^From"
   
   "^Organization:"
   "^X-Attribution:"
   "^Subject"
   "^Date"
   "^To"
   "^Cc"))