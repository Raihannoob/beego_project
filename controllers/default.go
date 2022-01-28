package controllers

import (
	"encoding/json"
	"fmt"
	"github.com/beego/beego/v2/client/httplib"
	beego "github.com/beego/beego/v2/server/web"
)

type MainController struct {
	beego.Controller
}

type Breed struct {
	Id   string `json:"id"`
	Name string `json:"name"`
}
type Categorie struct {
	Id   int    `json:"id"`
	Name string `json:"name"`
}
type Images struct {
	Url string `json:"url"`
}

func Goroutine(url string, ch chan string){
	
	req := httplib.Get(url)
	req.Header("x-api-key", "776a017e-416d-47f5-abbb-599b79a2329d")

	str, err := req.String()
	if err != nil {
		panic(err)
	}

	ch <- string(str)

}


func (c *MainController) Get() {
	
	categoryChannel := make(chan string)
	breedChannel := make(chan string)
	imageChannel := make(chan string)
	go Goroutine("https://api.thecatapi.com/v1/categories", categoryChannel)
	go Goroutine("https://api.thecatapi.com/v1/breeds",breedChannel)
	go Goroutine("https://api.thecatapi.com/v1/images/search?limit=6", imageChannel)

	cat1 := []Categorie{}
	json.Unmarshal([]byte(<-categoryChannel), &cat1)

	bre1 := []Breed{}
	json.Unmarshal([]byte(<-breedChannel), &bre1)


	Img := []Images{}
	json.Unmarshal([]byte(<-imageChannel), &Img)

	close(categoryChannel)
	close(breedChannel)
	close(imageChannel)

	c.Data["Categorie"] = cat1
	c.Data["Breed"] = bre1	
	c.Data["images"] = &Img
	fmt.Println(Img)
	c.TplName = "index.tpl"	

}

func (c *MainController) GetData() {
	
	breed := c.GetString("breed")
	order := c.GetString("order")
	mime_types := c.GetString("mime_types")
	category := c.GetString("category")
	limit := c.GetString("limit")
	page := c.GetString("page")
	req := httplib.Get("https://api.thecatapi.com/v1/images/search")
	req.Header("x-api-key", "776a017e-416d-47f5-abbb-599b79a2329d")
	req.Param("limit", limit)
	req.Param("category_ids", category)
	req.Param("breed_id", breed)
	req.Param("order", order)
	req.Param("mime_types", mime_types)
	req.Param("page", page)
	str, err := req.String()
	if err != nil {
		panic(err)
	}
	fmt.Printf("t1: %T\n", str)
	Img := []Images{}
	json.Unmarshal([]byte(str), &Img)
	c.Data["images"] = &Img
	c.Data["json"]= &Img
	c.ServeJSON()
}
