 t3=ScopeData.time;
 x3=ScopeData.signals(1).values;
 x3=x3(:);
 u3=ScopeData.signals(2).values;
 u3=u3(:);
%iff x1>x2>x3 
x2=[x2;zeros(length(x1)-length(x2),1)];
x3=[x3;zeros(length(x1)-length(x3),1)];
u2=[u2;zeros(length(u1)-length(u2),1)];
u3=[u3;zeros(length(u1)-length(u3),1)];
X=[x1,x2,x3];
U=[u1,u2,u3];
%save
 t2=ScopeData.time;
 x2=ScopeData.signals(1).values;
 x2=x2(:);
 u2=ScopeData.signals(2).values;
 u2=u2(:);

 t1=ScopeData.time;
 x1=ScopeData.signals(1).values;
 x1=x1(:);
 u1=ScopeData.signals(2).values;
 u1=u1(:);
 
 
 