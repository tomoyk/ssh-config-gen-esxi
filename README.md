# ssh-config-gen-esxi

This code generates [ssh_config](https://linux.die.net/man/5/ssh_config) from VMware ESXi machine list.

## Usage

1. Add `include` statement in ssh_config as follows

```
echo "Include ~/.ssh/config.gen" >> ~/.ssh/config
```

2. Run `collect.sh`

```
bash collect.sh
```

3. Verify the generated ssh_config

```
cat ~/.ssh/config.gen
```
