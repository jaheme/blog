package controllers

import (
	"blog/models"
	"blog/services"
	"github.com/astaxie/beego"
)

type LoginController struct {
	beego.Controller
}

func (this *LoginController) Get() {
	this.TplNames = "login.tpl"
}

func (this *LoginController) Post() {

}

type RegController struct {
	beego.Controller
}

// locat to reg page
func (this *RegController) Get() {
	uname := this.GetString("signup_name")
	beego.Info(uname)
	this.TplNames = "reg.tpl"
}

//handle reg request
func (this *RegController) Reg() {
	uname := this.GetString("uname")
	rname := this.GetString("rname")
	uemail := this.GetString("uemail")
	passw := this.GetString("passw")
	passw2 := this.GetString("passw2")
	reg := &models.UserReg{
		Uname:  uname,
		Rname:  rname,
		Uemail: uemail,
		Passw:  passw,
		Passw2: passw2,
	}
	msg := reg.Check()
	if msg != "" {
		this.Ctx.Output.SetStatus(500)
		this.Ctx.WriteString(msg)
		return
	}

	dbmsg, user := services.SaveReg(reg)
	if dbmsg == "" {
		if user != nil {
			this.SetSession("user", user)
			this.Ctx.WriteString("ok")
		}
	} else {
		this.Ctx.Output.SetStatus(500)
		this.Ctx.WriteString(dbmsg)
	}
}
