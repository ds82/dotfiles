review() {
  T=`mktemp /tmp/glab.XXXXXX`
  MR=$1
  glab api /projects/:id/merge_requests/$MR >> $T
  SHA=$(jq -r '.sha' $T)
  TARGET=$(jq -r '.target_branch' $T)
  echo "compare origin/$TARGET..$SHA"
  nvim +"DiffviewOpen origin/$TARGET..$SHA"
}
