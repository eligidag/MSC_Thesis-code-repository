%a{1} = dsphere(16,32,[16,16,-30]);
%a{2} = dsphere(16,32,[16,16, 0]);
%final_mask = dynamo_mask_combine(a);
%dwrite(final_mask, 'mask123.em')
r = 75;  
x = 16;
y = 16;
z = -66;
sp_outer = dsphere(170,128,[0,0,0]);
dwrite(sp_outer, 'sp_outer.em');
%sp_inner = dsphere(70,32,[16,25,-62]);
%sp_inner = 1-sp_inner;
%dwrite(sp_inner, 'sp_inner.em');
%sp_limiter = dsphere(16,32,[17,22,12]);
%dwrite(sp_limiter, 'sp_limiter.em')
%sp_whole = sp_outer.*sp_inner.*sp_limiter;
%dwrite(sp_whole, 'sp_whole.em');