package main

import (
	"net/http"
	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	router.GET("/", greet)
	router.GET("/items", items)
	router.POST("/items", additems)
	router.HEAD("/healthcheck", healthcheck)

	router.Run()
}
type Items struct{
	ID int  `json:"id"`
	NAME string  `json:"name"`
}

var Listitems= []string{"Galactic Goggles","Meteor Muffins","Alien Antenna Kit",	"Starlight Lantern","Quantum Quill"}

func items(c *gin.Context){
	 item := []Items{} 
	for i,name := range Listitems{
		item=append(item,Items{ID : i +1 ,NAME : name})
	}
	c.JSON(http.StatusOK,item )
}
type NewItem struct{
	NAME string  `json:"name"`
}
func additems(c *gin.Context){
	var newItem NewItem
	// item := []Items{} 
	if err := c.BindJSON(&newItem);err != nil{
		return
	}
	var item_id = len(Listitems)+1
	Listitems=append(Listitems,Items{ID: item_id, NAME: newItem.NAME,})
	c.JSON(http.StatusOK, Items{ID: item_id, NAME: newItem.NAME,})
	

	
}
func greet(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, "Welcome, Go navigator, to the Anythink cosmic catalog.")
}


func healthcheck(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"status": "ok",
	})
}


