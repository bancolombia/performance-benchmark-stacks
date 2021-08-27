const { isInPercentage } = require('./percentage');
let { Observable, defer, of, EMPTY } = require('rxjs');
let { takeLast, expand } = require('rxjs/operators');

async function start(fn, percentage, delay) {
    let count = 0;
    if (isInPercentage(percentage)) {
        const endMillis = (new Date()).getTime() + delay;
        do {
            await fn();
            count++;
        } while (delay !== 0 && (new Date()).getTime() <= endMillis);
    }
    return count;
}

const query$ = (count, fn) => defer(async () => {
    await fn();
    return count + 1
});

const startReactive = (fn, percentage, delay) => {
    const endMillis = new Date().getTime() + delay;
    let count = 0;
    if (isInPercentage(percentage)) {
        return query$(count, fn)
            .pipe(
                expand(result => (delay !== 0 && (new Date().getTime() <= endMillis)) ? query$(result, fn) : EMPTY),
                takeLast(1)
            )
    }
    return of(count)
}


module.exports = { start, startReactive };
