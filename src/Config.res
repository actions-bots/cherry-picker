open Belt.Option

type t = {
  // Specifies whether everyone is allowed to cherry pick.
  allow_all: bool,
  // Specifies whether to create an Issue when there is a PR conflict.
  create_issue_on_conflict: bool,
  // Specifies the label prefix for cherrypicker.
  label_prefix: string,
  // Specifies the label prefix after picked.
  picked_label_prefix: string,
  // Specifies the labels that need to be excluded when copying the labels of the original PR.
  exclude_labels: array<string>,
  // Specifies whether to copy the issue numbers from the squashed commit message.
  copy_issue_numbers_from_squashed_commit: bool,
}

let fromActions = () => {
  {
    allow_all: Core.getBooleanInput(~name="allow-all")->getWithDefault(false),
    create_issue_on_conflict: Core.getBooleanInput(
      ~name="create-issue-on-conflict",
    )->getWithDefault(false),
    label_prefix: Core.getInput(~name="label-prefix")->getWithDefault("needs-cherry-pick/"),
    picked_label_prefix: Core.getInput(~name="picked-label-prefix")->getWithDefault(
      "cherry-picked/",
    ),
    exclude_labels: Core.getMultilineInput(~name="exclude-labels"),
    copy_issue_numbers_from_squashed_commit: Core.getBooleanInput(
      ~name="copy-issue-numbers-from-squashed-commit",
    )->getWithDefault(false),
  }
}
