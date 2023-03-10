// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Belt_Option = require("rescript/lib/js/belt_Option.js");
var Core = require("@actions/core");

function fromActions(param) {
  return {
    allow_all: Belt_Option.getWithDefault(Core.getBooleanInput("allow-all"), false),
    create_issue_on_conflict: Belt_Option.getWithDefault(Core.getBooleanInput("create-issue-on-conflict"), false),
    label_prefix: Belt_Option.getWithDefault(Core.getInput("label-prefix"), "needs-cherry-pick/"),
    picked_label_prefix: Belt_Option.getWithDefault(Core.getInput("picked-label-prefix"), "cherry-picked/"),
    exclude_labels: Core.getMultilineInput("exclude-labels"),
    copy_issue_numbers_from_squashed_commit: Belt_Option.getWithDefault(Core.getBooleanInput("copy-issue-numbers-from-squashed-commit"), false)
  };
}

exports.fromActions = fromActions;
/* @actions/core Not a pure module */
