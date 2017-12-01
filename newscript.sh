#!/bin/sh
touch $1
echo "#!/bin/sh" > $1
sudo chmod 775 $1
sudo chgrp uli $1
sudo chown uli $1
