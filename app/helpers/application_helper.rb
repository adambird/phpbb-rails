require 'cgi'

module ApplicationHelper
  
  CLEAN_MARKUP = /(\[(\w*|(\w*)=[\w]*):[\w]*\])|(\[\/((\w*):\w*)\])/x
  CLEAN_URLS = /(\[((url=[\w:\/.+_\-$%&]*)|(\/url))\])/x
  REPLACE_APOSTROPHE = /(\ufffd){3}/
  REPLACE_GBP = /(\ufffd){2}/
  
  def clean_body(body)
    if body
      clean = body.gsub(CLEAN_MARKUP, '')
      clean = clean.gsub(CLEAN_URLS, '')
      clean = clean.gsub(REPLACE_APOSTROPHE, "'")
      clean = clean.gsub(REPLACE_GBP, "\x156")
    end
  end
  
  def remove_html_escape(text)
    CGI.unescapeHTML(text)
  end
end
