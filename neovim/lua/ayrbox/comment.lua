local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

-- Enable Comment.nvim
comment.setup()
