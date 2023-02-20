package handler

import (
	"gin/httpd/utils"
	"gin/services"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

func Crypt(c *gin.Context) {
	if percentage, err := strconv.ParseInt(c.DefaultQuery("percentage", "100"), 10, 32); err == nil {
		if delay, err := strconv.ParseInt(c.DefaultQuery("delay", "0"), 10, 32); err == nil {
			plain := []byte(uuid.New().String())
			times := utils.Loop(services.GenerateAndValidate(plain), percentage, delay)
			c.JSON(http.StatusOK, gin.H{
				"status":  "Ok",
				"applied": true,
				"times":   times,
			})
		}
	}
}
