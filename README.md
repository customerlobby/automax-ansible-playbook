Ansible Playbook to Install automax on any ec2 nodes

    Usage:
        -n tagname:  The Instance Tag on which component playbook needs to be run.
        -p privatekeypath: Path for Private Key File
        -u user: Instance User to SSH
        -a access key: access key for automax
        -l use local installer: This Option uses installation script  from  repo doesnt download it
    Examples:
        ./run-playbook.sh  -n testnode -p privatekeypath -a access_key -l true

    This uses ansible dynamic inventory where you can give instance nodes with Name tag to install