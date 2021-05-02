# matlabnohup
A script to run a MATLAB script via a BASH command `nohup` ("no hangups")

## PROBLEM
You might be using a small-scale remote host (e.g., a virtual machine) that doesn't have a job manager. You need to run a batch of MATLAB processing that would take 10 hours. You might have realized that, if you disconnect, the MATLAB will also close and everything just stops. So you just kept the terminal open on your laptop and waited until the remote host finally finishes all of your jobs. And you wondered🤔️: *'Can I just let it run by itself without installing a job manager on my VM?'*

The answer is [nohup](https://en.wikipedia.org/wiki/Nohup) ("no hangups")! And this is just a small script that generates some wrappers to run your MATLAB script via nohup🤗️.

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

By default, job logs will be saved in "${HOME}/matlabnohup/" (e.g., if your account is "user123", it will be "/home/user123/matlabnohup/" on Linux servers). If you want save the logs in "/whereever/":
```
>> matlabnohup('myScript', '/whereever/')
```


(cc) 2021, sgKIM.
