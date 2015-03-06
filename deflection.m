function y=deflection(moment,EI,length)
    s=moment./EI;
    conc_load=zeros(1001,2);
    t=s*length/1000;
    conc_load(:,1)=t;
    conc_load(:,2)=0:length/1000:length;
    g=0:length/1000:length;
    
    ct=1;
    Reac_A=0;
    while ct<1001
        Reac_A=Reac_A+conc_load(ct,1)*(length-conc_load(ct,2));
        ct=ct+1;
    end
    Reac_A=Reac_A/length;

    h=(-Reac_A)*g;
    ct=1;
    while ct<=1001
        n=floor(conc_load(ct,2)*1000/length)+1;
        while n<=1001
            h(n)=h(n)+conc_load(ct,1)*(g(n)-conc_load(ct,2));
            n=n+1;
        end 
        ct=ct+1;
    end
    y=h;
end