const {isInPercentage} = require('./percentage');

test('should calculate percentage', () => {
    // Arrange
    const percentage = 50;
    const max = parseFloat(100);
    const tolerance = 10;
    let real = 0;
    // Act
    for (let i = 0; i < max; i++) {
        if (isInPercentage(percentage)) {
            real++;
        }
    }
    // Assert
    console.log(real)
    const realPercentage = real / max;
    const maxPercentage = (percentage + tolerance) / max;
    console.log(realPercentage * max + "% of max " + maxPercentage * max + "%");
    expect(realPercentage).toBeLessThan(maxPercentage);
});
