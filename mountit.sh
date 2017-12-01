#!/bin/sh
sudo mount -t cifs //fs-de-ew-01/Gruppen /mnt/Gruppen -o user=uhansen
sudo mount -t cifs //fs-de-ew-01/Gruppen/Hard/Hansen /mnt/Hansen -o user=uhansen
sudo mount -t cifs //DE-WS-16/Shared /mnt/Shared -o user=uhansen

