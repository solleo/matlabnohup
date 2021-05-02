path0 = pwd;
fn = matlabnohup(fullfile(pwd,'myScript1.m'), fullfile(pwd,'log'));
pause(20)
system(['cat ',fn])
figure;
for i = 1:10
  I = imread(['/tmp/',num2str(i),'.png']);
  imshow(I); drawnow;
end
close(gcf)