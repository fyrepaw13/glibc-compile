# glibc-compile

If you have tried compiling a binary using an older version of libc, you might've encountered the error 

```
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found
```

This might especially be more apparent when you are creating heap based challenges using a vulnerability depending on an older version of libc. If you're like me and using Kali Linux, you might realise that you cannot build binaries on a system with a newer version of libc. So, the solution to this would be to compile it in an environment using an older version of libc. One such method to do this is by using Dockerfiles.

In the dockerfile provided, change the line

```
FROM ubuntu:18.04
```

To any other base images depending on which libc version you want. Some of the ones that I tested with are 

```
FROM ubuntu:25.04@sha256:95a416ad2446813278ec13b7efdeb551190c94e12028707dd7525632d3cec0d1 - (GNU C Library (Ubuntu GLIBC 2.41-6ubuntu1.1) stable release version 2.41)

FROM ubuntu:20.04 - (C Library (Ubuntu GLIBC 2.31-0ubuntu9.17) stable release version 2.31)

FROM ubuntu:18.04 - (GNU C Library (Ubuntu GLIBC 2.27-3ubuntu1.6) stable release version 2.27)

FROM ubuntu:16.04 - (GNU C Library (Ubuntu GLIBC 2.23-0ubuntu11.3) stable release version 2.23, by Roland McGrath et al)
```

You should put all 3 files in the same directory

- Dockerfile
- build-and-compile.sh
- Your C source code

Then, run the `build-and-compile.sh` script to automatically build the docker image, compile the binary and automatically copy the binary out to your host machine. It also uses pwninit (assuming you already have pwninit installed) to patch the binary so that you can create an exploit locally.
