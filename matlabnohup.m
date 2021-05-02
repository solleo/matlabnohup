function fn_log = matlabnohup(script_to_run, path_log)
% A script to run MATLAB script via nohup ("no hangups")
%
% [SYNTAX]
% [fn_log] = matlabnohup(script_to_run, [path_script], [path_log])
%
% [USAGE]
% When you have a script "myScript.m" in a directory in MATLAB's path:
% >> matlabnohup('myScript')
%
% When you have a script "myScript.m" in "/somewhere/else/" that is not 
% in MATLAB's PATH:
% >> matlabnohup('/somewhere/else/myScript.m')
%
% By default, job logs will be saved in "${YOURHOME}/matlabnohup/" (e.g.,
% if you use Mac OS and your account is "foo", it will be 
% "/Users/foo/matlabnohup"). If you want save the logs in "/whereever/":
% >> matlabnohup('myScript', '/whereever/')
%
% (cc) 2021, sgKIM. https://github.com/solleo/matlabnohup

if ispc
  error('no nohup in Windows. Sorry?')
end

%% Set path_log
if ~exist('path_log','var')
  user_home = getenv('HOME');
  path_log = fullfile(user_home,'matlabnohup');
end
if ~isfolder(path_log), mkdir(path_log); end

%% Set jobid
job_id = finduniquejobnumber(path_log);
path_job = fullfile(path_log, job_id);
mkdir(path_job)

%% Set runme.m
fn_m = fullfile(path_job,'runme.m');
fid = fopen(fn_m,'w');
[path_script,name_script,~] = fileparts(script_to_run);
if ~isempty(path_script)
  fprintf(fid,'cd %s\n',path_script);
end
fprintf(fid,'%s\nexit\n',name_script);
fclose(fid);

%% Set runme.sh
fn_sh = fullfile(path_job,'runme.sh');
fid = fopen(fn_sh,'w');
fprintf(fid,'#!/bin/bash\ncd %s\n',path_job);
fprintf(fid,'matlab -nodesktop -nodisplay -nosplash -r runme\n');
fclose(fid);

%% now run:
fn_log = fullfile(path_job,'run.log');
fid = fopen(fn_log,'w');
fprintf(fid, '[%s] JOB started: %s\n',mfilename, datestr(now,31));
fclose(fid);
system(['nohup bash ',fn_sh,' >>',fn_log,' 2>>',fn_log,'&']);
fprintf('[%s] JOB created: %s\n',mfilename, fn_log);
end


function job_id = finduniquejobnumber(path_log)
% get current jobIDs in the folder:
files = dir(fullfile(path_log,'*'));
files = files([files.isdir]);
files(ismember({files.name},{'.','..'})) = [];
if ~isempty(files)
  current_ids = cell2mat(cellfun(@str2double, {files.name}, 'uni',0));
else
  current_ids = 0;
end
current_ids(isnan(current_ids)) = [];
% just one bigger:
job_id = sprintf('%06i', max(current_ids) + 1);
% fprintf('[%s] JOBID=%s\n',mfilename,jobid);
end