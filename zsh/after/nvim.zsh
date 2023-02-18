alias v=nvim

diffview() {
  nvim +"DiffviewOpen $1..$2"
}
