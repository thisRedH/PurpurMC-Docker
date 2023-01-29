#!/usr/bin/env bash

#* All Arguments Supportet
#MC_URL_ZIP_SERVER_FIILES=""        # Zip for all of the server files. Gets merged with the current Server Folder
#MC_VERSION="1.19.2"                # Minecraft Server version
#MC_EULA="true"                     # Minecraft's Eula
#MC_RAM_XMS="1536M"                 # Preallocated RAM
#MC_RAM_XMX="2048M"                 # Max RAM
#MC_PRE_JAR_ARGS=""                 # ARG's before the JAR
#MC_POST_JAR_ARGS=""                # ARG's after the JAR

MCDIR="/home/server"
MCJAR="$MCDIR/purpur_$MC_VERSION.jar"
MCTEMP="/server_tmp"
MCARGS="-Xms$MC_RAM_XMS -Xmx$MC_RAM_XMX $MC_PRE_JAR_ARGS -jar $MCJAR $MC_POST_JAR_ARGS"     # -Xms<> -Xmx<> <args> -jar <jar> <args>

cd $MCDIR

echo "###############################################"
echo "#   PurpurMC - `date`   #"
echo "###############################################"

function GetFile {
    curl -s -C - -o $2 $1
    if ! [ $? == 0 ]; then
        echo "Could not get $1"
    else
        echo "Downloaded $1"
    fi
}

# Getting Server files from user
GetFile "$MC_URL_ZIP_SERVER_FIILES" "$MCDIR/ZIP_SERVER_FILES"
unar "$MCDIR/ZIP_SERVER_FILES" -f

# checking if the jar exists, else download it
if ! [ -f $MCJAR ]; then
    echo "Downloading Purpur jar"
    curl -s -o $MCJAR https://api.purpurmc.org/v2/purpur/$MC_VERSION/latest/download
else
    curl -s -C - -o $MCJAR https://api.purpurmc.org/v2/purpur/$MC_VERSION/latest/download
fi

# cleaning jars that are not needed
find $MCDIR -type f -name "*.jar" ! -name $MCJAR -exec rm {} +

# accepting EULA
if [ "$MC_EULA" == "true" ]; then
    printf "eula=true" > $MCDIR/eula.txt
fi

# running minecraft with java
java $MCARGS
