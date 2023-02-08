open Jest
open Expect

describe("test matchCherryPickCommand", () => {
  test("should match", () => {
    expect(Util.matchCherryPickCommand("/cherrypick xx"))->toStrictEqual(["xx"])
    expect(Util.matchCherryPickCommand("/cherry-pick xx"))->toStrictEqual(["xx"])
  })

  test("should mismatch", () => {
    expect(Util.matchCherryPickCommand("/cherrypickxxx"))->toStrictEqual([])
    expect(Util.matchCherryPickCommand("/cherry-pickxxx"))->toStrictEqual([])
  })

  test("multiline", () => {
    expect(
      Util.matchCherryPickCommand(`
/cherry-pick r
xxxx

/cherry-pick    releasev0.3
/cherrypick releasev0.3
/cherrypick release/v0.5
/cherrypick release/v0.5😊
        `),
    )->toStrictEqual(["r", "releasev0.3", "release/v0.5", "release/v0.5😊"])
  })
})

describe("test matchLabel", () => {
  test("normal", () => {
    let m = Util.matchLabel(["needs-cherry-pick-", "lbw"])
    expect(m("lbwnb"))->toBe(Some("nb"))
    expect(m("needs-cherry-pick-xxx"))->toBe(Some("xxx"))
    expect(m("needs-cherry-pick-lbw"))->toBe(Some("lbw"))
    expect(m("hello"))->toBe(None)
  })

  test("empty label prefix", () => {
    let m = Util.matchLabel([])
    expect(m("lbwnb"))->toBe(None)
    expect(m("needs-cherry-pick-xxx"))->toBe(None)
    expect(m("needs-cherry-pick-lbw"))->toBe(None)
  })
})

// describe("test isCherryPickInviteCommand", () => {
//   test("normal", () => {
//     expect(isCherryPickInviteCommand('lbwnb')).toBeFalsy();
//     expect(isCherryPickInviteCommand('/cherrypick-')).toBeFalsy();
//     expect(isCherryPickInviteCommand('/cherry-pick')).toBeFalsy();
//     expect(isCherryPickInviteCommand('/cherrypick-invite')).toBeTruthy();
//     expect(isCherryPickInviteCommand('/cherry-pick-invite')).toBeTruthy();
//   });

//   test('Test word bound', () => {
//     expect(isCherryPickInviteCommand('/cherrypick-invitexx')).toBeFalsy();
//     expect(isCherryPickInviteCommand('/cherrypick-invite lbw')).toBeTruthy();
//     expect(isCherryPickInviteCommand('/cherrypick-invite_lbw')).toBeFalsy();
//   });
// });
