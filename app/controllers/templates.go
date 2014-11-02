package controllers

import (
    "fmt"
 	"encoding/json"
    "io/ioutil"
    "os"
	"github.com/revel/revel"
)

type JSONObject struct {
    Pages   []PagesType
}

type PagesType struct {
	Index        string
    Title        string
    Description  string
    Keywords     string
}

type ErrorResponseType struct {
	Status     bool
	Message    error
}


type Templates struct {
	App
	*revel.Controller
}

func (c Templates) PageData() revel.Result {

    rootpath, err := os.Getwd()
    if err != nil {
        fmt.Printf("File error: %v\n", err)
        errorjson := ErrorResponseType{Status: false, Message: err}
        return c.RenderJson(errorjson)
    }

    file, e := ioutil.ReadFile(fmt.Sprintf("%s/json/pages.json", rootpath))

    if e != nil {
        fmt.Printf("File error: %v\n", e)
        errorjson := ErrorResponseType{Status: false, Message: e}
        return c.RenderJson(errorjson)
    }

    fmt.Printf("%s\n", string(file))

    var jsondata JSONObject

    json.Unmarshal(file, &jsondata)

    fmt.Printf("Results: %v\n", jsondata)

	return c.RenderJson(jsondata)
}

func (c Templates) Header() revel.Result {
	return c.RenderTemplate("templates/header.html")
}

func (c Templates) Footer() revel.Result {
	return c.RenderTemplate("templates/footer.html")
}

func (c Templates) HomePage() revel.Result {
	return c.RenderTemplate("templates/home.html")
}

func (c Templates) Biography() revel.Result {
	return c.RenderTemplate("templates/biography.html")
}

func (c Templates) Playground() revel.Result {
	return c.RenderTemplate("templates/playground.html")
}

func (c Templates) Contact() revel.Result {
	return c.RenderTemplate("templates/contact.html")
}

func (c Templates) Error404() revel.Result {
	return c.RenderTemplate("templates/404.html")
}

func (c Templates) Error500() revel.Result {
	return c.RenderTemplate("templates/500.html")
}