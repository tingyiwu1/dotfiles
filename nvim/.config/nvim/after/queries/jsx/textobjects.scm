; extends

; jsx_element - outer includes the tags
(jsx_element) @tag.outer

; jsx_element - inner content between tags
; Pattern 1: Single child (immediate siblings of opening tag)
((jsx_element
  open_tag: (_)
  .
  (_) @tag.inner
  .
  close_tag: (_)))

; Pattern 2: Multiple children (create range from first to last)
((jsx_element
  open_tag: (_)
  .
  (_) @_start
  (_) @_end
  .
  close_tag: (_))
  (#make-range! "tag.inner" @_start @_end))

; jsx_self_closing_element (e.g., <Component />)
(jsx_self_closing_element) @tag.outer
