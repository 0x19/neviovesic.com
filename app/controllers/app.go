package controllers

import "github.com/revel/revel"

type App struct {
	*revel.Controller
}

func (c App) Router() revel.Result {
	return c.Render()
}