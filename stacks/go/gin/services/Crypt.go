package services

import "golang.org/x/crypto/bcrypt"

func GenerateAndValidate(plain []byte) func() {
	return func() {
		if hash, err := Encrypt(plain); err == nil {
			Validate(plain, hash)
		}
	}
}

func Encrypt(plain []byte) ([]byte, error) {
	return bcrypt.GenerateFromPassword(plain, 10)
}

func Validate(plain []byte, hash []byte) error {
	return bcrypt.CompareHashAndPassword(hash, plain)
}
