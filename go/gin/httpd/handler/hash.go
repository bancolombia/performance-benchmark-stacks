package handler

import (
	"gin/services"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

func Hash(c *gin.Context) {
	if percentage, err := strconv.ParseInt(c.Param("percentage"), 10, 32) ; err != nil{
		if delay, err := strconv.ParseInt(c.Param("delay"), 10, 32) ; err != nil{
			times := Loop(services.GenerateHash(),percentage, delay)
			c.JSON(http.StatusOK, gin.H{
			"status": "Ok",
			"applied": true,
			"times": times,
		})
		}
	}
}