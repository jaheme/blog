package admin

import (
	"blog/models"
	"blog/services"
	"github.com/astaxie/beego"
)

// admin
type AdminController struct {
	beego.Controller
}

// admin login
func (this *AdminController) Get() {
	this.toAdmin()
}

// admin login
func (this *AdminController) ALogin() {
	uname := this.GetString("uname")
	passw := this.GetString("passw")
	err, user := services.Login(uname, passw)
	if err != nil {
		this.Ctx.WriteString("login fail." + err.Error())
		return
	} else if user.IsAdmin == false {
		this.Ctx.WriteString("you are not admin.")
		return
	}
	this.SetSession("auser", user)
	this.toAdmin()
}

func (this *AdminController) toAdmin() {
	auser := this.GetSession("auser")
	if nil != auser {
		user := auser.(models.User)
		if user.Id > 0 && user.IsAdmin == true {
			this.Data["user"] = user
			this.TplNames = "admin/admin.tpl"
			return
		}
	}
	this.TplNames = "admin/alogin.tpl"
}

// admin user
type UserController struct {
	beego.Controller
}

func (u *UserController) Get() {
	u.TplNames = "admin/user_add.tpl"
}

func (u *UserController) Add() {
	uname := u.GetString("uname")
	rname := u.GetString("rname")
	uemail := u.GetString("uemail")
	passw := u.GetString("passw")
	passw2 := u.GetString("passw2")
	reg := &models.UserReg{
		Uname:  uname,
		Rname:  rname,
		Uemail: uemail,
		Passw:  passw,
		Passw2: passw2,
	}
	msg := reg.Check()
	if msg != "" {
		u.Ctx.Output.SetStatus(500)
		u.Ctx.WriteString(msg)
		return
	}
	msg, _ = services.SaveReg(reg)
	if msg == "" {
		u.List()
	} else {
		u.Ctx.Output.SetStatus(500)
		u.Ctx.WriteString(msg)
		return
	}
}

func (u *UserController) List() {
	us := services.ListUser()
	u.Data["us"] = us
	u.TplNames = "admin/user_list.tpl"
}

func (u *UserController) Operation() {
	opt_type := u.GetString("type")
	id, _ := u.GetInt("id")
	err := services.OptUser(id, opt_type)
	if nil == err {
		u.List()
	}
}
