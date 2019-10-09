#!/bin/bash

DIR=$(pwd)
HNAME=${PWD##*/}

newname="${HNAME// /-}"
HNAME=$( echo -n "${newname}" | sed 's/^ *//;s/ *$//' )

# sessions

rm -f $DIR/.sessions/"${HNAME}-mks"
cp $DIR/.sessions/default.vim $DIR/.sessions/"${HNAME}-mks"
rm -f $DIR/.sessions/default.vim
sed -i "s|tres333|${PWD}|" $DIR/.sessions/"${HNAME}-mks"
ln -s $DIR/.sessions/"${HNAME}-mks" $HOME/.vim/sessions/$HNAME.vim

echo "${HNAME}-mks - session is ready"
echo "*******************************"

# tmuxinator

sed -i "s/uno11/${HNAME}/" .general-tmuxinator.yml

sed -i "s|dos22|${DIR}/|" .general-tmuxinator.yml

sed -i "s|tres333|vim -S ~/.vim/sessions/${HNAME}.vim|" .general-tmuxinator.yml

rm -f $HOME/.tmuxinator/$HNAME.yml
ln -s $DIR/.general-tmuxinator.yml $HOME/.tmuxinator/$HNAME.yml

printf "#!/bin/bash\n\nvim -S ~/.vim/sessions/${HNAME}.vim" > edit.sh
chmod +x edit.sh launch.sh modd.conf

echo "${HNAME} - tmuxinator is ready"
echo "*******************************"
