#work with file like
#AKIAZ7RJAEWP3JO4DP7D +CXdfdfu5Qm9pec3I6aT9w9m9bU0WE9NP0M9/6+Ly
mkdir inprogress || true 
cat all_accounts_list.txt
while IFS=' ' read -r AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY; do
echo  AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
echo AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
ACCOUNT=$(aws sts get-caller-identity --query "Account" --output text)
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error credentials for account $ACCOUNT is incorrect "
fi
echo "START working with account $ACCOUNT"
cd ..
rsync -rv --exclude=.git bombardier  bombardier$ACCOUNT
cd bombardier
done <all_accounts_list.txt