# getting the size of the repository before cloning it 

# fortunately github has an api that provides the size of a repostory in kilobytes

repo_url="${@: -1}"
# | is used as a delimeter here 

repo_path=$(echo "$repo_url" \ 
    | sed 's|https://github.com/||' \ 
    | cut -d '/' -f 1,2
)


size=$(curl --silent \
    "https://api.github.com/repos/$repo_path" \
    | jq '.size'
)
echo "repository size: $size kB"
echo -n "Proceed to clone? [y/n]: "
read -r answer

if [[ "$answer" == "y" ]]; then
    git clone "$@"
else
    echo "Aborted"
fi
