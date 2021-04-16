const {isInPercentage} = require('./percentage');

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

module.exports = {start};
