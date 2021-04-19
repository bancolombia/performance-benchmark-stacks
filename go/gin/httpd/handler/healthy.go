package handler

import "github.com/gin-gonic/gin"

func Healthy(c *gin.Context) {
	c.JSON(200, gin.H{
		"message": "Ok",
	})
}