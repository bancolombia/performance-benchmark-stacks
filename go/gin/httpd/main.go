package main

import (
	"gin/httpd/handler"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("/status", handler.Healthy)
	r.GET("/hash/:percentage/:delay", handler.Hash)
	//r.GET("/crypt/:percentage/:delay", handler.Crypt)
	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}