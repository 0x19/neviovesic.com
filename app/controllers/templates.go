package controllers

import "github.com/revel/revel"

type Templates struct {
	App
	*revel.Controller
}

func (c Templates) Header() revel.Result {
	return c.RenderTemplate("templates/header.html")
}

func (c Templates) HeaderMini() revel.Result {
	return c.RenderTemplate("templates/header-mini.html")
}

func (c Templates) Footer() revel.Result {
	return c.RenderTemplate("templates/footer.html")
}

func (c Templates) HomePage() revel.Result {
	return c.RenderTemplate("templates/home.html")
}