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
	router.POST("/items",additem)
	router.HEAD("/healthcheck", healthcheck)

	router.Run()
}

type Item struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}
var names = []string{"Galactic Goggles","Meteor Muffins","Alien Antenna Kit","Starlight Lantern","Quantum Quill"}


type NewItem struct{
	Name string `json:"name"`
}

func additem(c *gin.Context){
var newItem  NewItem
if err := c.BindJSON(&newItem); err!=nil{
	c.JSON(http.StatusBadRequest,gin.H{"error": "invalid input"})
	return
}
var id_item=len(names)+1
names=append(names,newItem.Name)
items=append(items,Item{ID: id_item, Name : newItem.Name})
c.JSON(http.StatusOK,  Item{ID: id_item, Name: newItem.Name})

}
func item(c *gin.Context){
	items = []Item{}
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
