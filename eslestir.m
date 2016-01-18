function ciktim = eslestir(x, tanim)
if(tanim < 0.0326)

    if(x==1 || x ==2 || x ==3 || x ==4 || x ==5 )
        ciktim='Burak Genc';
    elseif(x==6 || x ==7 || x ==8 || x ==9 || x ==10 )
        ciktim='Hasan Coskun';
    elseif(x==11 || x ==12 || x ==13 ||x==14||x==15)
        ciktim='Osman Hafizoglu';
    elseif(x==16 || x ==17 || x ==18 ||x==19||x==20)
        ciktim='Fatih Kaplan';
    elseif(x==21 || x ==22 || x ==23 ||x==24||x==25)
        ciktim='Ibrahim Irdem';
    end
else
    ciktim = 'Taninamadi';
end
