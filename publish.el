;; publish.el — run with: emacs --script publish.el

(require 'ox-publish)

(setq org-publish-project-alist
      '(("utartuqc-page-content"
         :base-directory "./org"          ; where your .org files live
         :base-extension "org"
         :publishing-directory "./docs"   ; output goes here
         :recursive t                     ; include subdirectories
         :publishing-function org-html-publish-to-html

         ;; HTML options
         :with-toc nil
         :with-author t
         :with-creator nil
         :html-validation-link nil
         :html-head-include-default-style nil   ; no Org default CSS
         :html-head-include-scripts nil

         ;; Optional: link to your own CSS
         ;; :html-head "<link rel='stylesheet' href='/style.css'>"

         ;; Optional: preamble/postamble
         :html-preamble nil
         :html-postamble nil)

        ;; If you have static files (CSS, images), publish those too
        ("utartuqc-page-static"
         :base-directory "./org/static"
         :base-extension "css\\|js\\|png\\|jpg\\|ico\\|svg"
         :publishing-directory "./docs/static"
         :recursive t
         :publishing-function org-publish-attachment)

        ;; Umbrella project that runs both
        ("utartuqc-page"
         :components ("utartuqc-page-content" "utartuqc-page-static"))))

;; Force republish everything (skip cache)
(org-publish "utartuqc-page" t)
