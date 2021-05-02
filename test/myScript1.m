for i = 1: 10
  fprintf('processing...%i\n',i)
  figure;
  surf(rand(10),'facealpha',0.5);
  view(3)
  camlight
  try
    exportgraphics(gcf, ['/tmp/',num2str(i),'.png']);
  catch ME
    print(['/tmp/',num2str(i),'.png'],'-dpng');
  end
  close(gcf)
end
fprintf('DONE!\n');