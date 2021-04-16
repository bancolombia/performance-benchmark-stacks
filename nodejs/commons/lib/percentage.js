const MAX_PERCENTAGE = 100;

module.exports = {
    isInPercentage: (percentage) => {
        if (percentage === MAX_PERCENTAGE) {
            return true;
        }
        return Math.floor(Math.random() * MAX_PERCENTAGE) < percentage;
    }
}
