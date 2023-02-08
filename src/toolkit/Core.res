// binding to @actions/core

/**
 * Gets the value of an input.
 * the value is also trimmed.
 * Returns an empty string if the value is not defined.
 *
 * @param     name     name of the input to get
 * @returns   option<string>. none if name not found
 */
@module("@actions/core")
external getInput: (~name: string) => option<string> = "getInput"

/**
 * Gets the values of an multiline input.  Each value is also trimmed.
 *
 * @param     name     name of the input to get
 * @returns   string[]. empty array if name not found
 *
 */
@module("@actions/core")
external getMultilineInput: (~name: string) => array<string> = "getMultilineInput"

/**
 * Gets the input value of the boolean type in the YAML 1.2 "core schema" specification.
 * Support boolean input list: `true | True | TRUE | false | False | FALSE` .
 * The return value is also in boolean type.
 * ref: https://yaml.org/spec/1.2/spec.html#id2804923
 *
 * @param     name     name of the input to get
 * @returns   option<bool>. none if name not found
 */
@module("@actions/core")
external getBooleanInput: (~name: string) => option<bool> = "getBooleanInput"
