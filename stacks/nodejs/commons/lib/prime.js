function eratosthenes(top) {
    var all = new Uint8Array(new ArrayBuffer(top));
    var idx = 0;
    var prime = 3;
    var x, j;

    var result = "1 ";

    while (prime <= top) {
        var flag = true;
        for (x = 0; x < top; x++) {
            if (all[x] == prime) {
                flag = false;
                break;
            }
        }
        if (flag) {
            result += prime + " ";
            j = prime;
            while (j <= (top / prime)) {
                all[idx++] = prime * j;
                j += 1;
            }
        }
        prime += 2;
    }
    return result;
}

module.exports = { eratosthenes }
