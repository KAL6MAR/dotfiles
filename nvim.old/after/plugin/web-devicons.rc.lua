local status, icons = pcall(require, 'nvim-web-devicons')
if (not status) then return end

icons.set_icon {
  cls = {
    icon = "󰢎 ",
    color = "#1798c1",
    name = "cls"
  },
  cmp = {
    icon = " ",
    color = "#e34c26",
    name = "cmp"
  },
  page = {
    icon = " ",
    color = "#e34c26",
    name = "page"
  },
  design = {
    icon = " ",
    color = "#e34c26",
    name = "design"
  },
  trigger = {
    icon = "󰢎 ",
    color = "#1798c1",
    name = "trigger"
  }
}

icons.setup {
  override = {},
  default = true
}
