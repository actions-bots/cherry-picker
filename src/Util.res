let matchCherryPickCommand = text => {
  let re = %re("/^(?:\/cherrypick|\/cherry-pick)\s+(.+)$/gm")

  let branches = Js.Dict.empty()

  let break = ref(false)
  while !break.contents {
    switch Js.Re.exec_(re, text) {
    | Some(r) =>
      switch Js.Nullable.toOption(Js.Re.captures(r)[1]) {
      | Some(branch) => Js.Dict.set(branches, Js.String2.trim(branch), ())
      | _ => ()
      }
    | None => break := true
    }
  }

  Js.Dict.keys(branches)
}

let matchLabel = (labelPrefixes, label) => {
  Js.Array2.find(labelPrefixes, Js.String2.startsWith(label))->Belt.Option.map(matched =>
    Js.String2.substringToEnd(label, ~from=Js.String2.length(matched))
  )
}
