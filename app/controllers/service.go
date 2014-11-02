package controllers

import "github.com/revel/revel"

type Service struct {
	App
	*revel.Controller
}

func (s Service) Nagios() revel.Result {
	return s.RenderText("OK")
}