package controllers

import "github.com/revel/revel"

type Templates struct {
	App
	*revel.Controller
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

func (c Templates) Contact() revel.Result {
	return c.RenderTemplate("templates/contact.html")
}