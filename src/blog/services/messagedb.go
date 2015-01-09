package services

import (
	"blog/models"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"time"
)

func AddMsg(uname, email, phone, msg string) error {
	db := orm.NewOrm()
	sql := "INSERT INTO message SET uname=?, email=?, phone=?, message=?, create_time=?"
	_, errIn := db.Raw(sql, uname, email, phone, msg, time.Now()).Exec()
	if errIn != nil {
		beego.Error("addMsg error: ", errIn.Error())
		return errIn
	}
	return nil
}

func ListMsg() (ms []models.Message) {
	sql := "select * from message order by id desc"
	db := orm.NewOrm()
	_, err := db.Raw(sql).QueryRows(&ms)
	if nil != err {
		beego.Error(err)
	}
	return
}
