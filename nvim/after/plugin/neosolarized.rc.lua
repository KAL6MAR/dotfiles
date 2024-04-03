local status, n = pcall(require, 'onedark')
if (not status) then return end

n.setup({
  style = 'cool',
  transparent = true,
  term_colors = true,
  cmp_itemkind_reverse = false,
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },
  lualine = {
    transparent = true, -- lualine center bar transparency
  },
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true,   -- use undercurl instead of underline for diagnostics
    background = true,    -- use background color for virtual text
  },
})
n.load()
--local colorbuddy = require('colorbuddy.init')
--local Color = colorbuddy.Color
--local colors = colorbuddy.colors
--local colors = colorbuddy.Group
--local Group = colorbuddy.Group
--local groups = colorbuddy.groups
--local styles = colorbuddy.styles

--Color.new('black', '#0000000')
--Group.new('CursorLine', colors.none, colors.base03, styles.None, colors.base1)
--Group.new('CursorLineNr', colors.yellow, colors.black, styles.None, colors.base1)
--Group.new('Visual', colors.none, colors.base03, styles.reverse)

--local cError = groups.Error.fg
--local cInfo = groups.Information.fg
--local cWarn = groups.Warning.fg
--local cHint = groups.Hint.fg

--Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
--Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
--Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
--Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
--Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
--Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
--Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
--Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)


