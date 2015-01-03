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
	v.TplNames = "blog.tpl"
}

func (v *ViewController) View() {
	url := v.Ctx.Input.Param(":url")
	if "" == url {
		v.Ctx.WriteString("url invalid.")
	} else {
		a := services.GetArticle(url)
		v.Data["a"] = a
		v.TplNames = "article_view.tpl"
	}
}
