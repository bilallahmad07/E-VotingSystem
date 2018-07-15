package bilal;
import java.util.Random;
public class OTP {
    public long random() {
        Random r=new Random();
        long x=0,n;
        for(int i=1;i<=5;i++){
            n=0;
            while(n==0)
            n=r.nextInt(10);
            x=x*10+n;
        }
        return x;
    }
}

