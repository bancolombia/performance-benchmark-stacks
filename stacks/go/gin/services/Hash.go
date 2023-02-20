package services

import (
	"github.com/google/uuid"
	"golang.org/x/crypto/sha3"
)

func GenerateHash() func() {
	return func() {
		buf := []byte(uuid.New().String())
		h := make([]byte, 32)
		d := sha3.NewShake256()
		d.Write(buf)
		d.Read(h)
	}
}
