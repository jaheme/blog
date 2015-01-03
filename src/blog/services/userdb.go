package services

import (
	"blog/models"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"time"
)

func SaveReg(m *models.UserReg) (string, *models.User) {
	u := getByName(m.Uname)
	if u != nil {
		beego.Info(".............")
		return "user name exists", nil
	}
	db := orm.NewOrm()
	sql := "INSERT INTO user SET uname=?, rname=?, uemail=?, passw=?, create_time=?, login_time=?"
	_, errIn := db.Raw(sql, m.Uname, m.Rname, m.Uemail, m.Passw, time.Now(), time.Now()).Exec()
	if errIn != nil {
		beego.Error("SaveReg error: ", errIn.Error())
		return "save error", nil
	}
	user := getByName(m.Uname)
	return "", user
}

func getByName(uname string) (user *models.User) {
	db := orm.NewOrm()
	sel := "SELECT * FROM user WHERE uname=?"
	errdb := db.Raw(sel, uname).QueryRow(&user)
	if errdb != nil {
		beego.Error(errdb.Error())
		return nil
	}
	beego.Info(user)
	return user
}

func Login(uname, passw string) (error, models.User) {
	sql := "SELECT * FROM user WHERE uname=? AND passw=?"
	db := orm.NewOrm()
	var user models.User
	errdb := db.Raw(sql, uname, passw).QueryRow(&user)
	return errdb, user
}

func ListUser() (us []models.User) {
	sql := "select * from user order by id desc"
	db := orm.NewOrm()
	_, err := db.Raw(sql).QueryRows(&us)
	if nil != err {
		beego.Error(err)
	}
	return
}

func OptUser(id int64, opt_type string) error {
	var sql string = ""
	if opt_type == "normal" {
		sql = "update user set is_admin = 0 where id=?"
	} else if opt_type == "admin" {
		sql = "update user set is_admin = 1 where id=?"
	} else if opt_type == "unlock" {
		sql = "update user set is_lock = 0 where id=?"
	} else if opt_type == "lock" {
		sql = "update user set is_lock = 1 where id=?"
	}
	db := orm.NewOrm()
	_, err := db.Raw(sql, id).Exec()
	if nil != err {
		beego.Error(err)
	}
	return err

}
