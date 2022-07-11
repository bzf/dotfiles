local M = {}

local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix

local app_directory = function(filepath)
  return string.gmatch(filepath, "app/([^/]+)/")()
end

local get_parent_class = f(function(arg, parent)
  local directory_name = app_directory(parent.env.TM_FILEPATH)

  if directory_name == "controllers" then
    return "ApplicationController"
  elseif directory_name == "models" then
    return "ApplicationRecord"
  elseif directory_name == "policies" then
    return "ApplicationPolicy"
  elseif directory_name == "components" then
    return "ViewComponent::Base"
  else
    return directory_name
  end
end, {})

local get_class_name = f(function(arg, parent)
  local class_path = string.gmatch(parent.env.TM_FILEPATH, "app/[^/]+/(%S+).rb")()
  return class_path:gsub("/", " "):gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end):gsub(" ", "::"):gsub("_", "")
end, {})

M.class_definition = fmt(
  "class {} < {}\n  {}\nend",
  {
    get_class_name,
    get_parent_class,
    i(0),
  }
)

return M
