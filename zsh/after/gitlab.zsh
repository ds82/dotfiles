review() {
  T=`mktemp /tmp/glab.XXXXXX`
  MR=$1
  glab api /projects/:id/merge_requests/$MR >> $T
  SHA=$(jq -r '.sha' $T)
  TARGET=$(jq -r '.target_branch' $T)
  nvim +"DiffviewOpen $SHA..origin/$TARGET"
}
