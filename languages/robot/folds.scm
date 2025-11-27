; Tree-sitter fold queries for Robot Framework files
; Mark nodes that editors should treat as foldable regions.
; Common foldable nodes include sections, definitions (keywords/tests/tasks),
; control blocks (loops/conditionals) and try/except/finally blocks.

[
  (section)                ; e.g. *** Settings ***, *** Test Cases ***
  (section_header)         ; explicit section header nodes, when present
  (setting_statement)      ; multi-line setting blocks
  (keyword_definition)     ; Keyword definitions with a body
  (test_case_definition)   ; Test case definitions with a body
  (task_definition)        ; Task definitions (if present in grammar)
  (for_statement)          ; FOR ... END blocks
  (while_statement)        ; WHILE ... END blocks
  (if_statement)           ; IF / ELSE IF / ELSE / END
  (try_statement)          ; TRY / EXCEPT / FINALLY / END
] @fold