result = []
for A = 0:1
    for B = 0:1
        for C = 0:1
            for D = 0:1
                for E = 0:1
                    for F = 0:1
                        if A+B >=1 && A+D ~=2 ...
                           && A+E+F ==2 && B==C && C+D ==1 ...
                           && (~(D==0 && E ==1))
                            result = [result;A,B,C,D,E,F];
                        end
                    end
                end
            end
        end
    end
end
