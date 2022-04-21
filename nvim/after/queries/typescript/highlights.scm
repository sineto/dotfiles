;; keywords
[
  "class"
  "const"
  "type"
  "enum"
  "namespace"
  "function"
] @BlueItalic

[
  "implements"
  "extends"
  "async"
] @PinkItalic

((predefined_type) @BlueItalic)
(template_substitution ["${" "}"] @Red)

;; variable declaration
(variable_declarator
  name: (identifier) @Purple)

(variable_declarator
  name: (identifier) @Green
  value: (arrow_function))

(variable_declarator
  name: (object_pattern
    (shorthand_property_identifier_pattern) @Purple))

(enum_declaration
  name: (identifier) @Blue)

(enum_assignment
  (property_identifier) @Purple)

(internal_module
  name: (identifier) @Blue)

;; call expression
(member_expression
  object: (this) @Fg4Italic)

;; new instance
(new_expression
  constructor: (identifier) @Green)
