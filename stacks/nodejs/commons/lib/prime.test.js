const { eratosthenes } = require('./prime');

test('should get prime numbers', () => {
    // Arrange
    const top = 100;
    const expected = '1 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 ';
    // Act
    const result = eratosthenes(top);
    // Assert
    expect(result).toBe(expected);
});