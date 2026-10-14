# lab-2-flask

лабораторная работа 2 по работе с `app.py`

Вся суть заключалась в том, что было необходимо собрать безопасный образ Flask.

## Для этого были проделаны следующие шаги

1. Получен файл **seed.json**
2. Создан Dockerfile
3. На основе этого файла (**п.2**) собран образ

## Вывод из консоли (Git Bash + Windows PowerShell)

### Windows PowerShell

проверка на версии нужного ПО

```powershell
PS C:\Users\User> jq --version

jq-1.8.2

PS C:\Users\User> cd .\Desktop\

PS C:\Users\User\Desktop> cat .\seed-mvladik.json

{
  "login": "mvladik",
  "token": "54be87d8f83d27efb6c5e7cb3eba8cc1",
  "prefix": "54be87d8"
}

PS C:\Users\User\Desktop> docker -v

Docker version 24.0.5, build ced0996

PS C:\Users\User\Desktop> git -v

git version 2.49.0.windows.1

PS C:\Users\User\Desktop> jq -v

jq: Unknown option -v Use jq --help for help with command-line options, or see the jq manpage, or online docs at https://jqlang.org

PS C:\Users\User\Desktop> jq --version

jq-1.8.2

PS C:\Users\User\Desktop>
```

### Git Bash

то, что выполнялось по самому Docker-образу

```bash
User@Home-PC MINGW64 /c/lab2
$ SEED_JSON=seed-mvladik.json

User@Home-PC MINGW64 /c/lab2
$ LOGIN=$(jq -r .login "$SEED_JSON")

User@Home-PC MINGW64 /c/lab2
$ TOKEN=$(jq -r .token "$SEED_JSON")

User@Home-PC MINGW64 /c/lab2
$ PREFIX=$(jq -r .prefix "$SEED_JSON")

User@Home-PC MINGW64 /c/lab2
$ docker build \
> --build-arg LAB_LOGIN="$LOGIN" \
> --build-arg LAB_TOKEN="$TOKEN" \
> -t "$LOGIN/image-lab:$PREFIX" .
[+] Building 2.6s (8/13)                                                                                                                                                              docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                            0.0s
 => => transferring dockerfile: 916B                                                                                                                                                            0.0s
 => [internal] load .dockerignore                                                                                                                                                               0.1s
 => => transferring context: 34B                                                                                                                                                                0.1s
 => [internal] load metadata for docker.io/library/python:3.12-slim                                                                                                                             2.3s
 => [auth] library/python:pull token for registry-1.docker.io                                                                                                                                   0.0s
 => [internal] load build context                                                                                                                                                               0.0s
 => => transferring context: 1.10kB                                                                                                                                                             0.0s
 => CANCELED [builder 1/4] FROM docker.io/library/python:3.12-slim@sha256:a6e34c598f2467ed0e9a8d349809fcd8b5c603269512df273a0bb1784edc11b1                                                      0.1s
 => => resolve docker.io/library/python:3.12-slim@sha256:a6e34c598f2467ed0e9a8d349809fcd8b5c603269512df273a0bb1784edc11b1                                                                       0.0s
 => => sha256:a6e34c598f2467ed0e9a8d349809fcd8b5c603269512df273a0bb1784edc11b1 10.37kB / 10.37kB                                                                                                0.0s
 => CACHED [builder 2/4] WORKDIR /build                                                                                                                                                         0.0s
 => ERROR [builder 3/4] COPY app/requirements.txt .                                                                                                                                             0.0s
------
 > [builder 3/4] COPY app/requirements.txt .:
------
Dockerfile:4
--------------------
   2 |
   3 |     WORKDIR /build
   4 | >>> COPY app/requirements.txt .
   5 |     RUN pip install --no-cache-dir --prefix=/install -r requirements.txt
   6 |
--------------------
ERROR: failed to solve: failed to compute cache key: failed to calculate checksum of ref 9e98002b-e132-44bf-9bd5-511c7d7c5761::jlq3p23lrqk1j5o9uzo9gluf1: "/app/requirements.txt": not found

User@Home-PC MINGW64 /c/lab2
[+] Building 0.8s (7/12)                                                                                  docker:default
 => [internal] load .dockerignore                                                                                   0.0s
 => => transferring context: 34B                                                                                    0.0s
 => [internal] load build definition from Dockerfile                                                                0.0s
 => => transferring dockerfile: 916B                                                                                0.0s
 => [internal] load metadata for docker.io/library/python:3.12-slim                                                 0.6s
 => [internal] load build context                                                                                   0.0s
 => => transferring context: 55B                                                                                    0.0s
 => CANCELED [builder 1/4] FROM docker.io/library/python:3.12-slim@sha256:a6e34c598f2467ed0e9a8d349809fcd8b5c60326  0.1s
 => => resolve docker.io/library/python:3.12-slim@sha256:a6e34c598f2467ed0e9a8d349809fcd8b5c603269512df273a0bb1784  0.0s
 => CACHED [builder 2/4] WORKDIR /build                                                                             0.0s
 => ERROR [builder 3/4] COPY app/requirements.txt .                                                                 0.0s
------
 > [builder 3/4] COPY app/requirements.txt .:
------
Dockerfile:4
--------------------
   2 |
   3 |     WORKDIR /build
   4 | >>> COPY app/requirements.txt .
   5 |     RUN pip install --no-cache-dir --prefix=/install -r requirements.txt
   6 |
--------------------
ERROR: failed to solve: failed to compute cache key: failed to calculate checksum of ref 9e98002b-e132-44bf-9bd5-511c7d7c5761::tp0ci968o90rjuy8kybkcy1er: "/app/requirements.txt": not found

User@Home-PC MINGW64 /c/lab2
$ docker build --build-arg LAB_LOGIN="$LOGIN" --build-arg LAB_TOKEN="$TOKEN" -t "$LOGIN/image-lab:$PREFIX" .
[+] Building 24.0s (13/13) FINISHED                                                                       docker:default
 => [internal] load .dockerignore                                                                                   0.0s
 => => transferring context: 34B                                                                                    0.0s
 => [internal] load build definition from Dockerfile                                                                0.0s
 => => transferring dockerfile: 916B                                                                                0.0s
 => [internal] load metadata for docker.io/library/python:3.12-slim                                                 0.6s
 => [internal] load build context                                                                                   0.0s
 => => transferring context: 134B                                                                                   0.0s
 => [runtime 1/5] FROM docker.io/library/python:3.12-slim@sha256:a6e34c598f2467ed0e9a8d349809fcd8b5c603269512df273  9.8s
 => => resolve docker.io/library/python:3.12-slim@sha256:a6e34c598f2467ed0e9a8d349809fcd8b5c603269512df273a0bb1784  0.0s
 => => sha256:a6e34c598f2467ed0e9a8d349809fcd8b5c603269512df273a0bb1784edc11b1 10.37kB / 10.37kB                    0.0s
 => => sha256:2b4f19dae3a777dfc3b76730bda1e82e1f66ab2a2686fa93ca78edbfb4f04ffe 1.75kB / 1.75kB                      0.0s
 => => sha256:df18428df8a0f9189c84e7424d214b4c50092af1f9dca5842a00c41c39bda316 5.66kB / 5.66kB                      0.0s
 => => sha256:ecc510c1e359bdc007b39802570bb7e4dec7d6ebccf357c3201a74299113e05e 29.84MB / 29.84MB                    4.2s
 => => sha256:75b6a36c64a1cf3520fc4b4aae4739d5caa8a6a05c27835a920a61784c9c32f8 1.29MB / 1.29MB                      0.5s
 => => sha256:6912e23eb44595b44dc6d9882b34f305ad6f6e9667cec70b13e5dbc4f8cd97f4 12.12MB / 12.12MB                    5.2s
 => => sha256:bbc5a12237474ec0b23b5051260d56d6436a24d70d9cad961adebe7a037ed813 249B / 249B                          0.7s
 => => extracting sha256:ecc510c1e359bdc007b39802570bb7e4dec7d6ebccf357c3201a74299113e05e                           3.1s
 => => extracting sha256:75b6a36c64a1cf3520fc4b4aae4739d5caa8a6a05c27835a920a61784c9c32f8                           0.3s
 => => extracting sha256:6912e23eb44595b44dc6d9882b34f305ad6f6e9667cec70b13e5dbc4f8cd97f4                           1.5s
 => => extracting sha256:bbc5a12237474ec0b23b5051260d56d6436a24d70d9cad961adebe7a037ed813                           0.0s
 => [runtime 2/5] RUN useradd -u 10001 -m -s /usr/sbin/nologin appuser                                              0.6s
 => [builder 2/4] WORKDIR /build                                                                                    0.4s
 => [builder 3/4] COPY app/requirements.txt .                                                                       0.1s
 => [builder 4/4] RUN pip install --no-cache-dir --prefix=/install -r requirements.txt                             12.0s
 => [runtime 3/5] WORKDIR /app                                                                                      0.1s
 => [runtime 4/5] COPY --from=builder /install /usr/local                                                           0.2s
 => [runtime 5/5] COPY app/app.py /app/app.py                                                                       0.0s
 => => exporting layers                                                                                             0.2s
 => => writing image sha256:13729f684e7ea58810952fcfbedc08dbdb00c67b40db01057742ec559118ba12                        0.0s
 => => naming to docker.io/mvladik/image-lab:54be87d8                                                               0.0s

What's Next?
  View summary of image vulnerabilities and recommendations → docker scout quickview

User@Home-PC MINGW64 /c/lab2
$ docker images | grep image-lab
mvladik/image-lab   54be87d8   13729f684e7e   2 minutes ago   126MB

User@Home-PC MINGW64 /c/lab2
$ echo "LOGIN=$LOGIN PREFIX=$PREFIX"
LOGIN=mvladik PREFIX=54be87d8

User@Home-PC MINGW64 /c/lab2
$ docker run -d --rm --name lab \
>   --read-only \
>   -e ROCKET_SIZE=Big \
>   -e SECRET=test123 \
>   -p 8080:8000 "$LOGIN/image-lab:$PREFIX"
acee1049069e36f06d3131c8422077d0aad62638d7aef8cac300964c0ac47030

User@Home-PC MINGW64 /c/lab2
$ curl -s http://localhost:8080/health
{"status":"ok","uptime":26.3}

User@Home-PC MINGW64 /c/lab2
$ curl -s http://localhost:8080/
Hello from Docker! Rocket=Big

User@Home-PC MINGW64 /c/lab2
$ curl -s http://localhost:8080/proof
{"login":"mvladik","ok":true,"proof":"1a76cc78529bbf79b82440597619b64629eee80575909113ec66a61a63451d13"}

User@Home-PC MINGW64 /c/lab2
$ docker exec lab whoami
appuser

User@Home-PC MINGW64 /c/lab2
$ docker inspect --format '{{.State.Health.Status}}' lab
healthy

User@Home-PC MINGW64 /c/lab2
$ time docker stop lavb
Error response from daemon: No such container: lavb

real    0m0,461s
user    0m0,045s
sys     0m0,153s

User@Home-PC MINGW64 /c/lab2
$ time docker stop lab
lab

real    0m0,816s
user    0m0,046s
sys     0m0,168s

User@Home-PC MINGW64 /c/lab2
$ docker run -d --rm --name lab2 -e ROCKET_SIZE=Small -p 8080:8000 "$LOGIN/image-lab:$PREFIX"
e45158b335f065c77604b03c48fa6defec764f16c906505bf38026a0802bdb3d

User@Home-PC MINGW64 /c/lab2
$ curl -s http://localhost:8080/
Hello from Docker! Rocket=Small

User@Home-PC MINGW64 /c/lab2
$ docker stop lab2
lab2

User@Home-PC MINGW64 /c/lab2
$ docker login
Authenticating with existing credentials...
Login Succeeded

Logging in with your password grants your terminal complete access to your account.
For better security, log in with a limited-privilege personal access token. Learn more at https://docs.docker.com/go/access-tokens/

User@Home-PC MINGW64 /c/lab2
$ docker push "$LOGIN/image-lab:$PREFIX"
The push refers to repository [docker.io/mvladik/image-lab]
52eaf2b2a7e0: Pushed
8f49f7ea0250: Pushed
33c96984a0fe: Pushed
1a8249cf7862: Pushed
dca2a125b490: Mounted from library/python
b361fa3b9794: Mounted from library/python
e1fa2746ad6d: Mounted from library/python
15f1c8eb1ab1: Mounted from library/python
54be87d8: digest: sha256:1e29d6b9074ccd48f060915df33b4d100321459d34d1c8e41463cb2469281d33 size: 1991

User@Home-PC MINGW64 /c/lab2
$ docker inspect "$LOGIN/image-lab:$PREFIX" | grep -A2 Labels
            "Labels": null
        },
        "DockerVersion": "",
--
            "Labels": {
                "org.lab.login": "mvladik",
                "org.lab.token": "54be87d8f83d27efb6c5e7cb3eba8cc1"
```
