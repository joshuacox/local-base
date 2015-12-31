# local-base

Build base images for local docker

```
curl https://raw.githubusercontent.com/joshuacox/local-base/master/bootstrapbase.sh |bash
```

or you can build locally with

```
make fresh
```


alternatively you can add some lines to your /etc/ansible/hosts like this:

```
examplehost ansible_ssh_port=22 ansible_ssh_host=10.1.2.3 ansible_ssh_user=root
examplehost1 ansible_ssh_port=22 ansible_ssh_host=10.1.2.4 ansible_ssh_user=root
[local-base]
examplehost
examplehost1
```

and

```
make play
```

to install to those examplehosts
