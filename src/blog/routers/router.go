package routers

import (
	"blog/controllers"
	"blog/controllers/admin"
	"blog/controllers/ueditor"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.ViewController{}, "get:Index")
	beego.Router("/view/:url", &controllers.ViewController{}, "get:View")
	beego.Router("/reg", &controllers.RegController{}, "get:Get")
	beego.Router("/reg", &controllers.RegController{}, "post:Post")
	beego.Router("/login", &controllers.LoginController{}, "get:Get")
	beego.Router("/login", &controllers.LoginController{}, "post:Post")
	beego.Router("/ueditor/ctrl", &ueditor.UeditorController{}, "get:Get")
	beego.Router("/ueditor/ctrl", &ueditor.UeditorController{}, "post:Post")

	beego.Router("/admin", &admin.AdminController{}, "get:Get")
	beego.Router("/admin", &admin.AdminController{}, "post:ALogin")
	beego.Router("/admin/user/add", &admin.UserController{}, "get:Get")
	beego.Router("/admin/user/add", &admin.UserController{}, "post:Add")
	beego.Router("/admin/user/list", &admin.UserController{}, "get:List")
	beego.Router("/admin/user/opt", &admin.UserController{}, "get:Operation")
	beego.Router("/admin/article/new", &admin.ArticleController{}, "get:Get")
	beego.Router("/admin/article/save", &admin.ArticleController{}, "post:Save")
	beego.Router("/admin/article/list", &admin.ArticleController{}, "get:List")
	beego.Router("/admin/article/opt", &admin.ArticleController{}, "get:Operation")
}
