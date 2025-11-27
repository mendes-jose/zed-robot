; Tree-sitter queries for Robot Framework highlighting
; Unified, opinionated capture names to improve editor theming consistency.
; - Use conventional scope names where possible (e.g. @comment, @keyword, @function)
; - Provide distinct captures for control flow, exceptions, variables, sections, and strings
; - Keep patterns broad so they work across typical grammar node names used by this repo

; Comments and miscellaneous text
[
  (comment)
  (extra_text)
] @comment

; Section headers (*** Settings ***, *** Test Cases ***, etc.)
(section_header) @keyword.section

; Settings and setting names
; - Capture the setting name specially so themes can style them consistently
(setting_statement
  (setting_name) @keyword
  _
) @keyword

[
  "RETURN"
  (keyword_setting)
  (test_case_setting)
] @keyword

; Keyword and test-case definitions (names)
(keyword_definition (name) @function)
(test_case_definition (name) @function)

; Keyword invocations (calls) and their keyword token
(keyword_invocation (keyword) @function.call)

; Ellipses used in continuations
(ellipses) @punctuation.delimiter

; Strings, text content and inline python fragments
(text_chunk) @string
(inline_python_expression) @string.special

; Variables and definitions
(variable_definition (variable_name) @variable)
(variable_definition) @storage.modifier

; Inline variable usages (scalar/list/dict)
[
  (scalar_variable)
  (list_variable)
  (dictionary_variable)
] @variable

; Capture a variable name produced by other nodes (if present)
(variable_definition (variable_name) @variable)

; Control structures: loops
; - Mark loop keywords and loop nodes so they receive a "keyword.control.loop" style
[
  "IN"
  "IN RANGE"
  "IN ENUMERATE"
  "IN ZIP"
  (break_statement)
  (continue_statement)
] @keyword.control.loop

(for_statement) @keyword.control.loop
(for_statement "END") @keyword.control.loop

; While loops
(while_statement) @keyword.control.loop
(while_statement "END") @keyword.control.loop

[
  (if_statement)
  (if_statement (else_statement))
  (if_statement (elseif_statement))
  (if_statement "END")
] @keyword.control.conditional


; Exceptions / try/except/finally
[
  "TRY"
  "EXCEPT"
  "FINALLY"
] @keyword.control.exception
(try_statement) @exception
(try_statement "END") @exception
(try_statement (except_statement) @exception)
(try_statement (finally_statement) @exception)
(try_statement (else_statement) @exception)

; End of file
