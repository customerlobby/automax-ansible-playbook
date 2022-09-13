export ANSIBLE_HOST_CHECKING=False
export ANSIBLE_HOST_KEY_CHECKING=False

function main
{
    initScript "$@"
    [ x"$TAG_NAME" == "x" ] && echo "ERROR: -n TAG NAME must be specified" && usage "";exit 100
    [ x"$ACCESS_KEY" == "x" ] && echo "ERROR: -a ACCESS KEY must be specified" && usage "";exit 100
    target_tag="tag_Name_$TAG_NAME"
    echo "Runing Against $target_tag LOCAL_INSTALL=$LOCAL_INSTALL"
    ansible-playbook -i inventory playbook.yaml --extra-vars "target=$target_tag remote_user=admin ansible_user=$USER_NAME automax_access_key=$ACCESS_KEY local_install=$LOCAL_INSTALL" --user "$USER_NAME" --private-key "$PRIVATE_KEY_FILE"

    COMMAND_RESULT=`echo $?`
    echo "Checking for host availability"
    if [ $COMMAND_RESULT != 0 ]; then
        exit 1
    fi
}

function usage
{
    cat <<EOF

    Usage:
        -n tagname:  The Instance Tag on which component playbook needs to be run.
        -p privatekeypath: Path for Private Key File
        -u user: Instance User to SSH
        -a access key: access key for automax
        -l use local installer: This Option uses installation script  from  repo doesnt download it
    Examples:
        ./run-playbook.sh  -n testnode -p privatekeypath -a access_key -l true


EOF
}

function initScript
{
    COMPONENT=""
    TAG_NAME=""
    USER_NAME="ubuntu"
    LOCAL_INSTALL="true"
    while getopts h:n:u:p:a:l: opt
        do
           case "$opt" in
              h) usage "";exit 1;;
              n) TAG_NAME=$OPTARG;;
              u) USER_NAME=$OPTARG;;
              p) PRIVATE_KEY_FILE=$OPTARG;;
              a) ACCESS_KEY=$OPTARG;;
              l) LOCAL_INSTALL=$OPTARG;;
              \?) usage "";exit 1;;
           esac
        done
}

main "$@"
