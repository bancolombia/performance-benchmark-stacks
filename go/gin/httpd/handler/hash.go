package handler

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"golang.org/x/crypto/sha3"
)

func Hash(c *gin.Context) {
	if percentage, err := strconv.ParseInt(c.Param("percentage"), 10, 32) ; err != nil{
		if delay, err := strconv.ParseInt(c.Param("delay"), 10, 32) ; err == nil{
			times := Loop(Process(),percentage, delay)
			c.JSON(http.StatusOK, gin.H{
			"percentage": percentage,
			"delay": delay,
			"times": times,
		})
		}
	}
}

func Process() func() {
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