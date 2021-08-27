const { start, startReactive } = require('./delayed-task-runner');


test('should delay a task', () => {
    // Arrange
    const delay = 1000;
    let expected = (new Date()).getTime() + delay;
    // Act
    start(() => 10 / 50, 100, delay)
        .then(times => {
            // Assert
            const realEnd = (new Date()).getTime();
            // console.log("Real delay: " + (realEnd - (expected - delay)) + " expectedDelay: " + delay);
            expect(realEnd).toBeCloseTo(expected, -100)
            expect(times).toBeGreaterThan(0);
        });
});


test('should delay a task with Observable', done => {
    // Arrange
    const delay = 1000;
    let expected = (new Date()).getTime() + delay;
    // Act
    const fn = async () => Promise.resolve(10 / 50);

    startReactive(fn, 100, delay)
        .subscribe(times => {
            const realEnd = (new Date()).getTime();
            expect(realEnd).toBeCloseTo(expected, -100)
            expect(times).toBeGreaterThan(0);
            done();
        });

}, 5000);
