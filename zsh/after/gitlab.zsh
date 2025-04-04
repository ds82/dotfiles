
review() {
  MR=$1

  if [[ ! -n "$1" ]]; then
    MR=$(fzf-glab-mr-list)
  fi

  git fetch --all

  T=`mktemp /tmp/glab.XXXXXX`
  glab api /projects/:id/merge_requests/$MR >> $T
  SHA=$(jq -r '.sha' $T)
  TARGET=$(jq -r '.target_branch' $T)
  SOURCE=$(jq -r '.source_branch' $T)
  echo "compare origin/$TARGET..$SHA"
  git switch $SOURCE && git rho
  nvim +"DiffviewOpen origin/$TARGET..$SHA"
}
