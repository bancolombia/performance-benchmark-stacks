package co.com.bancolombia.utils;

import com.sun.org.apache.bcel.internal.generic.ARETURN;

public class Prime {
    public String primo (int N)
    {
        String str = "";

        boolean[] isPrime = new boolean[N + 1];
        for (int i = 2; i <= N; i++)
            isPrime[i] = true;

        for (int i = 2; i*i <= N; i++)
        {
            if (isPrime[i])
            {
                for (int j = i; i*j <= N; j++)
                    isPrime[i*j] = false;
            }
        }

        int primes = 0;
        for (int i = 2; i <= N; i++)
        {
            if (isPrime[i])
                str+= i+" ";
        }
        //System.out.println("str = " + str);
        return str;
    }
}
