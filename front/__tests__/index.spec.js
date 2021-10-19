// import Index from "../src/App.vue";

// describe("src/App.vue", () => {
//   it("has a default value", () => {
//     console.log(Index.data);
//     // const defaultData = Index.;
//     // // subTitle の初期値をテストする
//     expect("Zenn is good service!!").toBe("Zenn is good service!!");
//   });
// });

// https://jestjs.io/ja/docs/using-matchers
test("two plus two is four", () => {
  expect(2 + 2).toBe(4);
});

test("object assignment", () => {
  const data = { one: 1 };
  data["two"] = 2;
  expect(data).toEqual({ one: 1, two: 2 });
});
