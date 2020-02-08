clc
clf;
d = input(' Enter any digit  = ' , 's' )
symbol = abs(d);
tm =[49 50 51 65
    52 53 54 66
    55 56 57 67
    58 59 60 68]
for p = 1:4
    for q= 1:4
        if tm(p,q) == abs(d);
            break;
        end
    end
    if tm(p,q) == abs(d);
            break;
    end
end
f1=[697 770 852 941]
f2=[1209 1336 1477 1633]
n=0:204
x= sin(2*pi*n*f1(p)/8000) + sin(2*pi*n*f2(2)/8000);
k=[18 20 22 24 31 34 38 42]
f=fft(x)
val = abs(f);
stem(n,val);
grid;
xlabel("k")
ylabel("x[k]")
for s=5:8
    if val(s) > 80,break
    end
end

