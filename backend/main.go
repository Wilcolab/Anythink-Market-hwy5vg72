package main

import (
	"net/http"
	"github.com/gin-gonic/gin"
	"fmt"
)

func main() {
	router := gin.Default()
	router.GET("/", greet)
	router.GET("/items",item)
	router.HEAD("/healthcheck", healthcheck)

	router.Run()
}
type Item struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}

func item(c *gin.Context){
	
	names := []string{"Galactic Goggles","Meteor Muffins","Alien Antenna Kit","Starlight Lantern","Quantum Quill"}
	items:= []Item{}
	for i, name := range names{
		items=append(items,Item{ID: i+1 , Name : name})
	}
	fmt.Println("************************************")
	fmt.Print(items)
	fmt.Println("************************************")

	c.JSON(http.StatusOK, items)
}
func greet(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, "Welcome, Go navigator, to the Anythink cosmic catalog.")
}

func healthcheck(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"status": "ok",
	})
}
