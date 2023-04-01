echo ""

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[93m"
ENDCOLOR="\e[0m"

echo -e "${YELLOW}[INFO]${ENDCOLOR} "

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

    # Get name of machine
    machinename=`echo "$machine" | cut -d'/' -f 3`    
    # echo "Getting Configuration for: $machinename"
    
    echo -e "${YELLOW}[INFO]${ENDCOLOR} $(echo $machinename | sed 's/_/ /g')"
    echo ""

    find $machine/* -prune -type d | while IFS= read -r confversie; do

        echo "- $confversie"
        echo ""
        if [[ ! -f $confversie/config ]]; then
            echo "Place a 'config' file in: $confversie"
            exit 1
        fi
        source $confversie/config

        echo "BUILD: $BUILD"
        echo "BOARD: $BOARD"
        echo "REPO_URL: $REPO_URL"
        echo "USE_CONFIG_VERSION: $USE_CONFIG_VERSION"
        echo "USE_BRANCH: $USE_BRANCH"
        echo "USE_TAG: $USE_TAG"
        echo "USE_COMMIT: $USE_COMMIT"
        echo "USE_LATEST_TAG: $USE_LATEST_TAG"
        REPO_NAME=$(echo $REPO_URL | cut -d/ -f5 | cut -d. -f1)
        echo "REPO_NAME: $REPO_NAME"
        echo ""

        if [[ $BUILD == true ]]; then

            if [[ -d "./Marlin/" ]]; then 
                echo "existing Marling repo folder"
                rm -Rf Marlin
            fi

            git clone $REPO_URL

            # Override MarlinFirmware version using branch or tag
            if [[ $USE_LATEST_TAG == true ]] && [[ -z $USE_TAG ]] && [[ -z $USE_BRANCH ]]; then

                printf "\n\e[01;36mUse Latest\e[0m\n"
                cd ${REPO_NAME}/
                git fetch origin
                git checkout $(git describe --tags `git rev-list --tags --max-count=1`)
                printf "\nYou are now using git tag:\e[01;33m $(git tag --points-at HEAD)\e[0m\n\n"
                git_commit_hash=`git rev-parse --short HEAD`
                cd ..

            elif [[ $USE_COMMIT ]]; then

                printf "\n\e[01;36mUse COMMIT\e[0m\n"
                cd ${REPO_NAME}/
                git fetch origin
                git checkout $USE_COMMIT
                printf "\nYou are now using git commit:\e[01;33m $(git tag --points-at HEAD)\e[0m\n\n"
                git_commit_hash=`git rev-parse --short HEAD`
                fix_old_stuff
                cd ..

            elif [[ $USE_TAG ]]; then

                printf "\n\e[01;36mUse TAG\e[0m\n"
                cd ${REPO_NAME}/
                git fetch origin
                git checkout $USE_TAG
                printf "\nYou are now using git tag:\e[01;33m $(git tag --points-at HEAD)\e[0m\n\n"
                git_commit_hash=`git rev-parse --short HEAD`
                fix_old_stuff
                cd ..

            elif [[ $USE_BRANCH ]]; then

                printf "\n\e[01;36mUse Branch\e[0m\n"
                cd ${REPO_NAME}/
                git fetch origin
                git checkout $USE_BRANCH
                printf "\nYou are now using the latest commit in branch:\e[01;33m $(git branch | sed -n '/\* /s///p')\e[0m\n\n"
                git_commit_hash=`git rev-parse --short HEAD`
                fix_old_stuff
                cd ..

            else

                echo "no option selected!"
                exit 1

            fi

            # Find what board to build for 
            # BOARD=`ls -A1 $machine/board* | awk -F'=' '{print $2}'`
            echo "Getting Board Setting: $BOARD"
            if [[ -z "$BOARD" ]]; then
                echo "No board is found"
                exit 1
            fi

            # Copy custom Configuration files to Marlin folder 
            echo -e "${YELLOW}[INFO]${ENDCOLOR} Copy Configuration*.h files" 
            cp $machine/${USE_CONFIG_VERSION}/*.h ./${REPO_NAME}/Marlin/
            echo ""

            # Change the default board with value in environment variable
            echo -e "${YELLOW}[INFO]${ENDCOLOR} Modify board" 
            sed -i "s/default_envs = .*/default_envs = $BOARD/g" ./${REPO_NAME}/platformio.ini
            echo ""

            # Custom Pins file
            echo -e "${YELLOW}[INFO]${ENDCOLOR} Copy pins*.h file" 
            cp $machine/${USE_CONFIG_VERSION}/pins*.h ./${REPO_NAME}/Marlin/src/pins/mega/
            echo ""

            # define extension
            FW_EXTENSION=hex

            # Build Marlin firmware 
            # printf "\e[1;35mCompiling Marlin firmware..\e[0m\n\n"
            echo -e "${YELLOW}[INFO]${ENDCOLOR} Compiling Marlin firmware.." 
            platformio run -d ${REPO_NAME}/
            success=$?
            echo "$success"
            echo ""

            if [[ ${success} -eq 0 ]]; then
                currentpath=`pwd`
                OUTPUT_DIR=${currentpath}/compiled/$machinename/$BOARD
                mkdir -p $OUTPUT_DIR
                echo "$OUTPUT_DIR"

                export_filename="firmware_${USE_BRANCH}${USE_TAG}${USE_COMMIT}_${git_commit_hash}_${machinename}"

                # Write out config changes (find //JHG )
                echo -e "${YELLOW}[INFO]${ENDCOLOR} Exporting changes" 
                grep "JHG" $machine/${USE_CONFIG_VERSION}/*.h > $machine/${USE_CONFIG_VERSION}/config_changes.md
                echo ""

                # convert elf -> BIN 
                echo -e "${YELLOW}[INFO]${ENDCOLOR} Converting elf -> bin"
                ~/.platformio/packages/toolchain-atmelavr/bin/avr-objcopy -O binary ./${REPO_NAME}/.pio/build/$BOARD/firmware.elf $OUTPUT_DIR/${export_filename}.bin
                echo ""

                # printf "\nCopying compiled firmware to output folder..\n"
                echo -e "${YELLOW}[INFO]${ENDCOLOR} Copying compiled firmware to output folder.."
                cd ./${REPO_NAME}/.pio/build/$BOARD

                if [ $(find . -name "*.${FW_EXTENSION}") ];
                then
                    FIRMWARE_NAME=$(find . -name "*.${FW_EXTENSION}" -type f -exec basename {} .${FW_EXTENSION} ';')
                    cp $FIRMWARE_NAME.$FW_EXTENSION $OUTPUT_DIR/${export_filename}.$FW_EXTENSION

                    md5sum $OUTPUT_DIR/${export_filename}.$FW_EXTENSION > $OUTPUT_DIR/${export_filename}.md5

                    echo "$(echo $REPO_URL | awk -F'\\.git' '{print $1}')/${git_commit_hash}" > $OUTPUT_DIR/${export_filename}.md

                    # printf "\nValidating firmware checksum.."
                    echo ""
                    echo -e "${YELLOW}[INFO]${ENDCOLOR} Validating firmware checksum.."
                    if md5sum -c $OUTPUT_DIR/${export_filename}.md5;
                    then
                        printf "\e[0mMD5 Checksum Validation: \e[1;32mSucceeded\n"
                        echo ""
                        echo "  (\.   \      ,/)"
                        echo "   \(   |\     )/    Yer done!"
                        echo "   //\  | \   /\\"
                        echo "  (/ /\_#oo#_/\ \)   Happy 3D-Printing!"
                        echo "   \/\  ####  /\/"
                        echo "        '##'"
                        echo ""
                    else
                        printf "\e[0mMD5 Checksum Validation: \e[1;31mFailed\n"
                        printf "\n\e[1;31mBuild failed! \e[0mCheck the output above for errors\n"
                        exit 1
                    fi
                else
                    printf "\e[0mMD5 Checksum Validation: \e[1;31mFirmware file with $FW_EXTENSION file extension not found!\n"
                    printf "\n\e[1;31mBuild failed! \e[0mCheck the output above for errors\n"
                    exit 1
                fi

                cd ../../../../

            else
                printf "\n\e[1;31mBuild failed! \e[0mCheck the output above for errors\n"
                exit 1
            fi



        else
            echo "Building Skippling build: $BUILD"
        fi


        echo ""
        echo "----------------------------------------------------"

    done

done