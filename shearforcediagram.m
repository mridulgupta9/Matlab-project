function eq=shearforcediagram(RA,pointload,udl,ldl,length)
g=0:length/1000:length;

h=ones(size(g))*(-RA);

syms x;
ct=1;

while ct<1001
    if ldl (ct,4)~=ldl(ct,3)
        z=(((ldl(ct,2)-ldl(ct,1))/(ldl(ct,4)-ldl(ct,3)))*x+(ldl(ct,1)*ldl(ct,4)-ldl(ct,2)*(ldl(ct,3)))/(ldl(ct,4)-ldl(ct,3)));
        z=int(z,x);
        p=sym2poly(z);
        n=floor(ldl(ct,3)*1000/length)+1;
        
         while n<((floor(ldl(ct,4))*1000/length)+1)
            r=polyval(p,n/1000*length)-polyval(p,(ldl(ct,3)));
            h(n)=h(n)+r;
            n=n+1;
        end
        while n<=1001
            r=polyval(p,ldl(ct,4))-polyval(p,ldl(ct,3));
            h(n)=h(n)+r;
            n=n+1;
        end       
    end
    if udl (ct,3)~=udl(ct,2)
        z=udl(ct,1);
        z=int(z,x);
        p=sym2poly(z);
        n=floor(udl(ct,2)*1000/length)+2;
        
        while n<((floor(udl(ct,3))*1000/length)+2)
            r=polyval(p,n/1000*length)-polyval(p,(udl(ct,2)));
            h(n)=h(n)+r;
            n=n+1;
        end
        while n<=1001
            
            h(n)=h(n)+r;
            n=n+1;
        end        
    end
    n=floor(pointload(ct,2)*1000/length)+1;
    while n<=1001
            
            h(n)=h(n)+pointload(ct,1);
            n=n+1;
    end     
    ct=ct+1;
end

eq=h;
end