package main

import (
	_ "blog/routers"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

func main() {
	init_orm()

	beego.BeeLogger.EnableFuncCallDepth(true)
	beego.BeeLogger.SetLogFuncCallDepth(3)

	beego.Run()
}

func init_orm() {
	orm.RegisterDriver("mysql", orm.DR_MySQL)
	// orm.Debug = true
	orm.RegisterDataBase("default", "mysql", beego.AppConfig.String("dataSource"), 10, 20)
	// orm.RegisterModel(new(models.RenderKey))
	// orm.RegisterModel(new(models.Rendering))
	// orm.RegisterModel(new(models.Rendering_action))
}
