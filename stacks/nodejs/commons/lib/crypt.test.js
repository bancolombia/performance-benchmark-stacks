const {encrypt, validate} = require('./crypt');

test('should encrypt a string', () => {
    // Arrange
    const plain = 'qwertyuiop';
    // Act
    encrypt(plain)
        .then(encrypted => validate(plain, encrypted))
        .then(valid => {
            // Assert
            expect(valid).toBeTruthy();
        });
});
