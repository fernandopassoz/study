package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

func handleHello(c *gin.Context) {
	c.String(200, "Hello")
}

func handleRedirect(c *gin.Context) {
	c.String(200, "Redirect")
}

func middleHello(c *gin.Context) {
	fmt.Println("Hello")
	c.Next()
}

func middleRedirect(c *gin.Context) {
	fmt.Println("Redirect")
	c.Redirect(301, "/redirect")
}

func main() {
	r := gin.New()

	r.GET("/", middleHello, handleHello)
	r.GET("/test", middleRedirect, handleHello)
	r.GET("/redirect", handleRedirect)

	r.Run(":8080")

}
