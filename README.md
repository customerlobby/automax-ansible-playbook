
### How do I get set up? ###
    1. Install AWSCLI and configure AWS with the access key, secret key, region of the AWS account where the hosts to be provisioned exist.

    2. Export the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
    Example:
    export AWS_ACCESS_KEY_ID=‘AK123’
    export AWS_SECRET_ACCESS_KEY=‘abc123’

    3. Install Ansible (Install ansible version > 2.1, since few parameters from greater versions have been used in the playbooks)

    4. Run the shell script as given in the next section.

### How RUN Playbook 

    Usage:
        -n tagname:  The Instance Tag on which component playbook needs to be run.
        -p privatekeypath: Path for Private Key File
        -u user: Instance User to SSH
        -a access key: access key for automax
        -l use local installer: This Option uses installation script  from  repo doesnt download it
    Examples:
        ./run-playbook.sh  -n testnode -p privatekeypath -a access_key -l true

    This uses ansible dynamic inventory where you can give instance nodes with Name tag to install
