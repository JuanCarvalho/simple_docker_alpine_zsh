# simple_docker_alpine_zsh
## Simple Image / Container Alpine
**[zsh, oh-my-zsh, user - non root, sudo, .env file]**

---

**Directory structure**
```zsh
╭─juan@debian ~/simple_docker_alpine_zsh
╰─$ tree
.
├── docker-compose.yml
├── Dockerfile
├── LICENSE
├── README.md
└── src
    └── teste.txt

1 directory, 5 files
```
**Simple usage** (temporary container):
```sh
$ cd simple_docker_alpine_zsh
$ docker build -t my_alpine_image .
$ docker run -it --rm my_alpine_image
```
**Compose usage:**
```sh
$ cd simple_docker_alpine_zsh
$ docker-compose up -d
$ docker exec -it my_alpine zsh
```
