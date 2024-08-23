
review() {
  MR=$1

  if [[ ! -n "$1" ]]; then
    MR=$(fzf-glab-mr-list)
  fi

  T=`mktemp /tmp/glab.XXXXXX`
  glab api /projects/:id/merge_requests/$MR >> $T
  SHA=$(jq -r '.sha' $T)
  TARGET=$(jq -r '.target_branch' $T)
  echo "compare origin/$TARGET..$SHA"
  nvim +"DiffviewOpen origin/$TARGET..$SHA"
}
