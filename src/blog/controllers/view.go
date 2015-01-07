package controllers

import (
	"blog/services"
	"github.com/astaxie/beego"
)

type ViewController struct {
	beego.Controller
}

func (v *ViewController) Index() {
	as := services.ListArticle()
	v.Data["as"] = as
	v.TplNames = "index.html"
}

func (v *ViewController) View() {
	url := v.Ctx.Input.Param(":url")
	if "" == url {
		v.Ctx.WriteString("url invalid.")
	} else {
		a := services.GetArticle(url)
		v.Data["a"] = a
		v.TplNames = "post.html"
	}
}

func (v *ViewController) Contact() {
	v.TplNames = "contact.html"
}

func (v *ViewController) About() {
	v.TplNames = "about.html"
}
