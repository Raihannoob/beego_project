package controllers

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
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
func (c *MainController) Get() {
	req := httplib.Get("https://api.thecatapi.com/v1/categories")
	req.Header("x-api-key", "776a017e-416d-47f5-abbb-599b79a2329d")

	str, err := req.String()
	if err != nil {
		panic(err)
	}

	fmt.Printf("t1: %T\n", str)
	cat1 := []Categorie{}
	json.Unmarshal([]byte(str), &cat1)
	fmt.Println(cat1)
	fmt.Println(str)

	c.Data["Categorie"] = cat1

	req2 := httplib.Get("https://api.thecatapi.com/v1/breeds?attach_breed=0")
	req.Header("x-api-key", "776a017e-416d-47f5-abbb-599b79a2329d")
	str2, err := req2.String()
	if err != nil {
		panic(err)
	}

	fmt.Printf("t1: %T\n", str2)
	bre1 := []Breed{}
	json.Unmarshal([]byte(str2), &bre1)
	fmt.Println(bre1)
	fmt.Println(str2)
	c.Data["Breed"] = bre1
	fmt.Println(bre1)
	c.TplName = "index.tpl"


	req3 := httplib.Get("https://api.thecatapi.com/v1/images/search")
	req3.Header("x-api-key", "776a017e-416d-47f5-abbb-599b79a2329d")
	req3.Param("limit", "9")

	str3, err := req3.String()
	if err != nil {
		panic(err)
	}

	fmt.Printf("t1: %T\n", str3)
	Img := []Images{}
	json.Unmarshal([]byte(str3), &Img)
	fmt.Println(Img)
	fmt.Println(str3)
	c.Data["images"] = &Img
	fmt.Println(Img)
	c.TplName = "index.tpl"
}

func (c *MainController) FetchData() {

	// breed := c.GetString("breed")

	// req3 := httplib.Get("https://api.thecatapi.com/v1/images/search")
	// req3.Header("x-api-key", "776a017e-416d-47f5-abbb-599b79a2329d")
	// req3.Param("limit", "9")
	// req3.Param("breed_id", breed)
	// str3, err := req3.String()
	// if err != nil {
	// 	panic(err)
	// }

	// fmt.Printf("t1: %T\n", str3)
	// Img := []Images{}
	// json.Unmarshal([]byte(str3), &Img)
	// fmt.Println(Img)
	// fmt.Println(str3)
	// c.Data["images"] = &Img
	// fmt.Println(Img)
	// c.Data["json"]= &Img
	// c.ServeJSON()

	type Image struct {
		Url string `json:"url"`
	}

	// order := c.GetString("order")
	// mime_types := c.GetString("type")
	// category := c.GetString("category")
	breed := c.GetString("breed")
	limit := c.GetString("limit")



	url := "https://api.thecatapi.com/v1/images/search?breed_id=" + breed + "&limit=" + limit

	fmt.Println(url)

	req, _ := http.NewRequest("GET", url, nil)

	req.Header.Add("x-api-key", "776a017e-416d-47f5-abbb-599b79a2329d")

	res, _ := http.DefaultClient.Do(req)
	
	body, _ := ioutil.ReadAll(res.Body)

	

	img := []Images{}

	json.Unmarshal(body, &img)
	c.Data["images"] = &img

	c.Data["json"]= &img
	c.ServeJSON()
	//fmt.Println(a)
}