# matlabnohup
A script to run MATLAB script via nohup ("no hangups")

This allows you run things on a server of a VM (e.g., via ssh) and let it keep running after you disconnect.

## USAGE
When you have a script "myScript.m" in a directory in MATLAB's path:
```
>> matlabnohup('myScript')
```

When you have a script "myScript.m" in "/somewhere/else/" that is not in MATLAB's PATH:
```
>> matlabnohup('/somewhere/else/myScript.m')
```

By default, job logs will be saved in "${YOURHOME}/matlabnohup/" (e.g., if you use Mac OS and your account is "foo", it will be "/Users/foo/matlabnohup"). If you want save the logs in "/whereever/":
```
>> matlabnohup('myScript', '/whereever/')
```

For test, use `test/test.m`.

(cc) 2021, sgKIM.
