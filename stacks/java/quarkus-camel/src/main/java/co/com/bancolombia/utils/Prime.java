package co.com.bancolombia.utils;

public class Prime {
    public String primo(int n) {
        StringBuilder str = new StringBuilder();

        boolean[] isPrime = new boolean[n + 1];
        for (int i = 2; i <= n; i++)
            isPrime[i] = true;

        for (int i = 2; i * i <= n; i++) {
            if (isPrime[i]) {
                for (int j = i; i * j <= n; j++)
                    isPrime[i * j] = false;
            }
        }

        for (int i = 2; i <= n; i++) {
            if (isPrime[i])
                str.append(i).append(" ");
        }
        return str.toString();
    }
}
