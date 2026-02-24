# ssh-config-gen-esxi

This code generates [ssh_config](https://linux.die.net/man/5/ssh_config) from VMware ESXi machine list.

## Prerequisite

- Bash
- `sshpass` command

## Usage

1. Install sshpass command

Ubuntu:

```
sudo apt install sshpass
```

2. Check SSH

```
ssh root@your_esxi_hostname
```

3. Add `include` statement in ssh_config as follows

```
echo "Include ~/.ssh/config.gen" >> ~/.ssh/config
```

4. Run `collect.sh`

```
bash collect.sh
```

5. Verify the generated ssh_config

```
cat ~/.ssh/config.gen
```
