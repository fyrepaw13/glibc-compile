# glibc-compile

If you have tried compiling a binary using an older version of libc, you might've encountered the error 

```
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found
```

This might especially be more apparent when you are creating heap challenges using a vulnerability depending on an older version of libc. If you're like me and using Kali Linux, you might realise that you cannot build binaries on a system with a newer version of libc. So, the solution to this would be to compile it in an environment using an older version of libc. One such method to do this is by using Dockerfiles.
