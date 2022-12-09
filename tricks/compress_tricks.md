## compress tricks

```
tar --exclude='*.pyc' -I zstd  -cvf sandbox_python.tar.zst ansible/
```

using zstd



tar -axf test.tar.zst ansible2/