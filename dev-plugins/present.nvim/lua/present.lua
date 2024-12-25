local M = {}

M.setup = function()
end

---@class present.Slides
---@field slides string[]

---Parse the lines
---@param lines string[]: The lines in buffer
---@return present.Slides
local parse_slides = function(lines)
  local slides = { slides = {} }
  local curr_slide = {}

  local separator = "^#"

  for _, line in ipairs(lines) do
    print(line, "find:", line:find(separator), "|")
    if line:find(separator) then
      if #curr_slide > 0 then
        table.insert(slides.slides, curr_slide)
      end
      curr_slide = {}
    end
    table.insert(curr_slide, line)
  end
  table.insert(slides.slides, curr_slide)
  return slides
end

vim.print(parse_slides {
  "# HELLO",
  "This is ME.",
  "# WELCOME",
  "Home",
})

return M
