local status_ok, git_blame = pcall(require, "gitblame")

if not status_ok then 
  notify("Error loading blamer")
  return
end 

git_blame.setup {
  enabled = true
}
