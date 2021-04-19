package handler

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"golang.org/x/crypto/bcrypt"
)

 func Crypt(c *gin.Context) {
	if percentage, err := strconv.ParseInt(c.Param("percentage"), 10, 32) ; err != nil{
		if delay, err := strconv.ParseInt(c.Param("delay"), 10, 32) ; err == nil{
			plain := []byte(uuid.New().String())
			if hash, err := Encrypt(plain); err == nil{
				err := Validate(plain, hash)
				times := Loop(Process(), percentage, delay)
				c.JSON(http.StatusOK, gin.H{
				"status": "Ok",
				"applied": true,
				"times": times,
				"hash": hash,
				"err": err,
			})
			}else{
				c.JSON(http.StatusOK, gin.H{
					"status": "Ok",
					"applied": true,
					"times": 0,
					"hash": hash,
					"err": err,
				})
			}
			
		}else{
			c.JSON(http.StatusOK, gin.H{
				"status": "Ok",
				"applied": true,
				"times": 0,
				"hash": "error",
				"err": err,
			})
		}
	}
}

func Encrypt(plain []byte) ([]byte,error) {
	return bcrypt.GenerateFromPassword(plain, 10)
}


func Validate(plain []byte, hash []byte) error {
	return  bcrypt.CompareHashAndPassword(hash, plain)
} 

