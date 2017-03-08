% % y=[0.062 0.085 0.140 0.157 0.187 0.216 0.248 0.262 0.298 0.323;
% %     0.0287 0.0275 0.0268 0.0267 0.0271 0.0264 0.0257 0.0265 0.0271 0.0268;    
% %     0.8919 0.9135 0.9207 0.9203 0.9193 0.9223 0.9225 0.9231 0.9267 0.927];
% % bar(y);
% % grid on;
% % set(gca,'XTickLabel',{'时间（比例关系）','均方误差','识别率'})
% % legend('10','20','30','40','50','60','70','80','90','100');
% % title('隐层节点个数的影响');
% % 
% x=-10:0.1:10;
% y=1./(1+exp(-x));
% plot(x,a);
% axis off; hold on;
% plot([0 0],[min(y) max(y)],'k',[min(x) max(x)],[0 0],'k');
% ax=[max(x),max(x)-0.3,max(x)-0.3;0,0.2,-0.2];
% fill(ax(1,:),ax(2,:),'k');
% ay=[0,0.15,-0.15;max(y),max(y)-0.4,max(y)-0.4];
% fill(ay(1,:),ay(2,:),'k'); hold on
% for i=1:length(x)-1
%     if x(i)~=0
%         plot([x(i),x(i)],[0,0.1],'k'); hold on
%         a=text(x(i),-0.4,num2str(x(i)));
%         set(a,'HorizontalAlignment','center')
%     end
%     if y(i)~=0
%         plot([0,0.1],[y(i),y(i)],'k'); hold on
%         b=text(-0.4,y(i),num2str(y(i)));
%         set(b,'HorizontalAlignment','center')
%     end
% end
% c=text(-0.4,-0.4,num2str(0));
% set(c,'HorizontalAlignment','center')
%%
clear;
close all;

%%
x=-5:0.1:5;
y=1./(1+exp(-x));
figure; plot(x,y,'LineWidth',1.5);
hold on;
plot(x,1,'--');
%Draw axes
plot([0 0],[min(y)-0.2 max(y)+0.2],'k',[min(x)-1 max(x)+1],[0 0],'k');

% Draw arrows
ax=[max(x)+1,max(x)+1-0.3,max(x)+1-0.3; 0,0.12,-0.12];
fill(ax(1,:),ax(2,:),'k');
ay=[0,0.08,-0.08; max(y)+0.5,max(y)+0.5-0.4,max(y)+0.5-0.4];
fill(ay(1,:),ay(2,:),'k');

%%
text(0.2, 1.2, 'a', 'FontName','Times New Roman','FontAngle','Italic','FontSize',18, 'HorizontalAlignment','left')
text(4.9, 0, 'n','FontName','Times New Roman','FontAngle','Italic','FontSize',18, 'VerticalAlignment','top')
axis off
text(0, 0, '0','FontName','Times New Roman','FontAngle','Italic','FontSize',18, 'VerticalAlignment','top')

text(0, 1, '1','FontName','Times New Roman','FontAngle','Italic','FontSize',18, 'VerticalAlignment','top')

% hold on
