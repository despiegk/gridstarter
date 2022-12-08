## compress tricks

```
tar --exclude='*.pyc' -I zstd  -cvf test.tar.zst ansible/
```

using zstd



tar -axf test.tar.zst ansible2/