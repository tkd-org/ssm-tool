# README

## setup ssh_ec2 command on `~/.ssh/config`
```
host i-* mi-*
    ProxyCommand sh -c "ssh_ec2 %r %h --send-key-only && aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters 'portNumber=%p'"
```

## install ssh_ec2
- see https://github.com/moajo/ssh_ec2
