local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- signal()
  s("ngs", {
    t("signal("),
    i(1, "initialValue"),
    t(")"),
  }),

  -- input()
  s("nginput", {
    t("input("),
    i(1, "initialValue"),
    t(")"),
  }),

  -- output()
  s("ngoutput", {
    t("output<"),
    i(1, "void"),
    t(">()"),
  }),

  -- model()
  s("ngmodel", {
    t("model("),
    i(1, "initialValue"),
    t(")"),
  }),

  -- resource()
  s("ngresource", {
    t("resource({"),
    t({
      "",
      "  params: () => ",
    }),
    i(1, "params"),
    t({
      ",",
      "  loader: ({ params }) => ",
    }),
    i(2, "load(params)"),
    t({
      "",
      "})",
    }),
  }),

  -- Signal Form
  s("ngform", {
    t({
      "model = signal({",
      "  ",
    }),
    i(1, "title: ''"),
    t({
      "",
      "});",
      "",
      "form = form(this.model);",
    }),
  }),

  -- standalone component skeleton
  s("ngc", {
    t({
      "@Component({",
      "  selector: 'app-",
    }),
    i(1, "name"),
    t({
      "',",
      "  imports: [],",
      "  templateUrl: './",
    }),
    i(2, "name"),
    t({
      ".html',",
      "})",
      "export class ",
    }),
    i(3, "Name"),
    t({
      " {}",
    }),
  }),
}
