package main

import (
	"net/http"
	"github.com/gin-gonic/gin"
	"fmt"
	"strconv"
)

func main() {
	router := gin.Default()
	router.GET("/", greet)
	router.GET("/items", items)
	router.GET("/items/:id", getitems)
	
	router.POST("/items", additems)

	router.HEAD("/healthcheck", healthcheck)

	router.Run()
}
type Items struct{
	ID int  `json:"id"`
	NAME string  `json:"name"`
	ViewCount int    `json:"viewCount"`
}

var Listitems= []Items{ {ID: 1, NAME: "Galactic Goggles", ViewCount: 0},
    {ID: 2, NAME: "Meteor Muffins", ViewCount: 0},
    {ID: 3, NAME: "Alien Antenna Kit", ViewCount: 0},
    {ID: 4, NAME: "Starlight Lantern", ViewCount: 0},
    {ID: 5, NAME: "Quantum Quill", ViewCount: 0},
	
	
	}

func items(c *gin.Context){

	c.JSON(http.StatusOK,Listitems )
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
	item := Items{ID: item_id, NAME: newItem.NAME }
	Listitems=append(Listitems,item)
	c.JSON(http.StatusOK, item)
}
func getitems(c *gin.Context) {
 idstr := c.Param("id")
 id,err := strconv.Atoi(idstr)
 if err != nil {
	fmt.Println("Invalid ID:", err)
	c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid ID"})
	return
}
if id < 1 || id > len(Listitems) {
	c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid ID"})
	return
}
 fmt.Println("*********")
 fmt.Println(id)
 fmt.Println("*********")

 it := &Listitems[id]

 go func(t *Items){
	t.ViewCount++

 }(it)
 c.JSON(http.StatusOK, it.NAME)
 
}
func greet(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, "Welcome, Go navigator, to the Anythink cosmic catalog.")
}


func healthcheck(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"status": "ok",
	})
}


