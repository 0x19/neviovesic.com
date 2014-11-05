// GENERATED CODE - DO NOT EDIT
package routes

import "github.com/revel/revel"


type tApp struct {}
var App tApp


func (_ tApp) Router(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("App.Router", args).Url
}

func (_ tApp) Biography(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("App.Biography", args).Url
}

func (_ tApp) Playground(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("App.Playground", args).Url
}

func (_ tApp) Contact(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("App.Contact", args).Url
}


type tService struct {}
var Service tService


func (_ tService) Nagios(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("Service.Nagios", args).Url
}


type tTemplates struct {}
var Templates tTemplates


func (_ tTemplates) PageData(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("Templates.PageData", args).Url
}

func (_ tTemplates) Header(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("Templates.Header", args).Url
}

func (_ tTemplates) Footer(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("Templates.Footer", args).Url
}

func (_ tTemplates) HomePage(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("Templates.HomePage", args).Url
}

func (_ tTemplates) Biography(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("Templates.Biography", args).Url
}

func (_ tTemplates) Playground(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("Templates.Playground", args).Url
}

func (_ tTemplates) Contact(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("Templates.Contact", args).Url
}

func (_ tTemplates) Error404(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("Templates.Error404", args).Url
}

func (_ tTemplates) Error500(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("Templates.Error500", args).Url
}


type tTestRunner struct {}
var TestRunner tTestRunner


func (_ tTestRunner) Index(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("TestRunner.Index", args).Url
}

func (_ tTestRunner) Run(
		suite string,
		test string,
		) string {
	args := make(map[string]string)
	
	revel.Unbind(args, "suite", suite)
	revel.Unbind(args, "test", test)
	return revel.MainRouter.Reverse("TestRunner.Run", args).Url
}

func (_ tTestRunner) List(
		) string {
	args := make(map[string]string)
	
	return revel.MainRouter.Reverse("TestRunner.List", args).Url
}


type tStatic struct {}
var Static tStatic


func (_ tStatic) Serve(
		prefix string,
		filepath string,
		) string {
	args := make(map[string]string)
	
	revel.Unbind(args, "prefix", prefix)
	revel.Unbind(args, "filepath", filepath)
	return revel.MainRouter.Reverse("Static.Serve", args).Url
}

func (_ tStatic) ServeModule(
		moduleName string,
		prefix string,
		filepath string,
		) string {
	args := make(map[string]string)
	
	revel.Unbind(args, "moduleName", moduleName)
	revel.Unbind(args, "prefix", prefix)
	revel.Unbind(args, "filepath", filepath)
	return revel.MainRouter.Reverse("Static.ServeModule", args).Url
}


