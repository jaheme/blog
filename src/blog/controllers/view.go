package controllers

import (
	"blog/services"
	"github.com/astaxie/beego"
)

type ViewController struct {
	beego.Controller
}

func (v *ViewController) Index() {
	as := services.GetArticles(0)
	v.Data["as"] = as
	setTpl(v, "index.html")
}

func setTpl(v *ViewController, tplName string) {
	v.Layout = tplName
	v.TplNames = tplName
	v.LayoutSections = make(map[string]string)
	v.LayoutSections["Header"] = "header.html"
	v.LayoutSections["Navigation"] = "navigation.html"
	v.LayoutSections["Footer"] = "footer.html"
}

func (v *ViewController) View() {
	url := v.Ctx.Input.Param(":url")
	if "" == url {
		v.Ctx.WriteString("url invalid.")
	} else {
		a := services.GetArticle(url)
		v.Data["a"] = a
		setTpl(v, "post.html")
	}
}

func (v *ViewController) Contact() {
	setTpl(v, "contact.html")
}

func (v *ViewController) About() {
	setTpl(v, "about.html")
}
