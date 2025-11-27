; Indentation rules for Robot language (Tree-sitter query format)
; These captures are intended to be consumed by editors that support
; tree-sitter-based indentation queries.

; Keep the node names broad to match the grammar produced by this repo.

(keyword_definition) @indent
(test_case_definition) @indent

; Loops
(for_statement) @indent
(for_statement "END") @outdent
; Continuation lines inside arguments (e.g. using ... on the right side)
(for_statement
  right: (_ (arguments (continuation (ellipses) @outdent))))

(while_statement) @indent
(while_statement "END") @outdent

; Conditionals
(if_statement) @indent
(if_statement (elseif_statement) @outdent)
(if_statement (else_statement) @outdent)
(if_statement "END") @outdent

; Exception handling blocks
(try_statement) @indent
(try_statement (except_statement) @outdent)
(try_statement (finally_statement) @outdent)
(try_statement (else_statement) @outdent)
(try_statement "END") @outdent

; Keyword / test-case bodies - treat as blocks to indent
(keyword_definition (body) @indent)
(test_case_definition (body) @indent)

; Continuations (lines that end with ellipses) should not change indentation,
; but when they terminate (no more ellipses) subsequent lines align with the
; original block. Many editors map continuation behaviour via @outdent
(arguments (continuation (ellipses) @outdent))
