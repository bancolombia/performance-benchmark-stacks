const {sha256} = require('./hash');

test('should hash a string', () => {
    // Arrange
    const clear = 'qwertyuiop';
    const expected = '9a900403ac313ba27a1bc81f0932652b8020dac92c234d98fa0b06bf0040ecfd';
    // Act
    const hashed = sha256(clear);
    // Assert
    expect(hashed).toBe(expected);
});
