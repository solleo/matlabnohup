# matlabnohup
A script to run a MATLAB script via a BASH command `nohup` ("no hangups")

This allows you run things on a server of a VM (e.g., via ssh) and let it keep running after you disconnect (i.e., you don't have to sit in front of your laptop and wait hours until the process is done when you don't have a job manager on your remote computer; just let it run overnight and check the results next morning).

## INSTALL
On a host (a server or a VM), clone (or download) this repo and add that directory to your MATLAB's path:
```
>> addpath('/your/directory/matlabnohup/')
```
To see if it works on the host:
```
>> cd ('/your/directory/matlabnohup/test')
>> test
```

## USAGE
When you have a script "myScript.m" in a directory in MATLAB's path:
```
>> matlabnohup('myScript')
```

When you have a script "myScript.m" in "/somewhere/else/" that is not in MATLAB's PATH:
```
>> matlabnohup('/somewhere/else/myScript.m')
```

By default, job logs will be saved in "${HOME}/matlabnohup/" (e.g., if you use Mac OS and your account is "foo", it will be "/Users/foo/matlabnohup/"). If you want save the logs in "/whereever/":
```
>> matlabnohup('myScript', '/whereever/')
```


(cc) 2021, sgKIM.
