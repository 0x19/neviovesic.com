package controllers

import "github.com/revel/revel"

type App struct {
	*revel.Controller
}

func (c App) Router() revel.Result {
	return c.Render()
}

func (c App) Biography() revel.Result {
	return c.Render()
}

func (c App) Playground() revel.Result {
	return c.Render()
}

func (c App) Contact() revel.Result {
	return c.Render()
}