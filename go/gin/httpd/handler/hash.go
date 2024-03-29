package handler

import (
	"gin/httpd/utils"
	"gin/services"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

func Hash(c *gin.Context) {
	if percentage, err := strconv.ParseInt(c.DefaultQuery("percentage", "100"), 10, 32); err == nil {
		if delay, err := strconv.ParseInt(c.DefaultQuery("delay", "0"), 10, 32); err == nil {
			times := utils.Loop(services.GenerateHash(), percentage, delay)
			c.JSON(http.StatusOK, gin.H{
				"status":  "Ok",
				"applied": true,
				"times":   times,
			})
		}
	}
}
