package services

import (
	"github.com/google/uuid"
	"golang.org/x/crypto/sha3"
)
func GenerateHash() func() {
	return func()  {
		buf := []byte(uuid.New().String())
		// A MAC with 32 bytes of output has 256-bit security strength -- if you use at least a 32-byte-long key.
		h := make([]byte, 32)
		d := sha3.NewShake256()
		// Now write the data.
		d.Write(buf)
		// Read 32 bytes of output from the hash into h.
		d.Read(h)
	}
}