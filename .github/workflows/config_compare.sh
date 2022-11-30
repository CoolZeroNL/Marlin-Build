echo ""

# ---------------------------------------------------------------------------

# Check if custom configuration files exists within the docker container
CONFIG_CHECK=$(ls -1 ./configuration/*/*/*.h 2>/dev/null | wc -l)
if [ $CONFIG_CHECK = 0 ]
then
    printf "\n\e[1;31mNo custom Configuration files detected! \e[0mUsing default from Marlin folder..\n"
fi

# for each machine in Configuration folder:
shopt -s dotglob
find ./configuration/* -prune -type d | while IFS= read -r machine; do

    echo "machine: $machine"
    echo "" 

    find $machine/* -prune -type d | while IFS= read -r confversie; do

        echo "config: $confversie"
        echo ""
        if [[ ! -f $confversie/config ]]; then
            echo "Place a 'config' file in: $confversie"
            exit 1
        fi
        source $confversie/config

        echo "BOARD: $BOARD"
        echo "REPO_URL: $REPO_URL"
        echo "USE_BRANCH: $USE_BRANCH"
        echo "USE_CONFIG_VERSION: $USE_CONFIG_VERSION"
        echo "COMPARE_CONFIG_REPO_URL: $COMPARE_CONFIG_REPO_URL"
        echo "COMPARE_BRANCH: $COMPARE_BRANCH"
        echo "COMPARE_CONFIG: $COMPARE_CONFIG"

        REPO_NAME=$(echo $REPO_URL | cut -d/ -f5 | cut -d. -f1)
        echo "REPO_NAME: $REPO_NAME"

        COMPARE_CONFIG_REPO_NAME=$(echo $COMPARE_CONFIG_REPO_URL | cut -d/ -f5 | cut -d. -f1)
        echo "COMPARE_CONFIG_REPO_NAME: $COMPARE_CONFIG_REPO_NAME"        
        echo ""

        if [[ $COMPARE_CONFIG == true ]]; then

            git clone --depth 1 --branch $COMPARE_BRANCH $COMPARE_CONFIG_REPO_URL
            
            MARLIN_CONFIG="./$COMPARE_CONFIG_REPO_NAME/config/examples/Wanhao/Duplicator 6"
            echo "$MARLIN_CONFIG"
            OWN_CONFIG="$confversie"
            echo "$OWN_CONFIG"

            diff "$MARLIN_CONFIG/configuration.h" "$OWN_CONFIG/configuration.h"
        
        else
            echo "Compare Skipping: COMPARE_CONFIG: $COMPARE_CONFIG"
        fi

        echo ""
        echo "--------------------------"
    done

done