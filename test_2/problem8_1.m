n=6;
s=[];% s 为仅满足条件2的序列
for a=1:n
    for b=1:n
        for c=1:n
            for d=1:n
                for e=1:n
                    x=[a,b,c,d,e];
                    t=diff(x);%计算沿大小不等于 1 的第一个数组维度的 X 相邻元素之间的差分：
                    M=max(abs(t));%返回数组 X 中元素的绝对值的最大值
                    if M<5
                        s=[s;x];
                    end
                end
            end
        end
    end
end
count = 0;
s0=[];% s0 为同时满足两个条件的序列
for i=1:size(s,1)%size为返回维度1的长度
    t=s(i,:);
    t1=unique(t);%返回与t中相同的数据，但是不包含重复项
    if length(t1)>2
        s0=[s0;t];
        count = count + 1;
    end
end