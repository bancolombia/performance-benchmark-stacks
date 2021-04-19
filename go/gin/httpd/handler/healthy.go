package handler

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func Healthy(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"status": "UP",
	})
}
