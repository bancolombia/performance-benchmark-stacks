package main

import (
	"gin/httpd/handler"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("/status", handler.Healthy)
	r.GET("/hash/:percentage/:delay", handler.Hash)
	r.GET("/crypt/:percentage/:delay", handler.Crypt)
	r.Run()
}
