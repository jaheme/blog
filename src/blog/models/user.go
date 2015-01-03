package models

import (
	"time"
)

type User struct {
	Id         int32
	Uname      string
	Passw      string
	Rname      string
	Uemail     string
	CreateTime time.Time
	LoginTime  time.Time
	IsAdmin    bool
	IsLock     bool
}

func (u *User) Check() string {
	if len(u.Passw) < 5 || len(u.Uname) < 3 || len(u.Rname) < 3 {
		return "密码的长度至少6个字符,用户名至少4个字符."
	}
	return ""
}

type UserReg struct {
	Uname  string
	Rname  string
	Uemail string
	Passw  string
	Passw2 string
}

func (r *UserReg) Check() string {
	if len(r.Passw) > 5 && len(r.Passw2) > 5 && len(r.Uname) > 3 {
		if r.Passw != r.Passw2 {
			return "两次密码不一致."
		}
	} else {
		return "密码的长度至少6个字符,用户名至少4个字符."
	}
	return ""
}

type Login struct {
	Uname string
	Passw string
	Admin bool
}

func (l *Login) Check() string {
	if len(l.Passw) < 5 || len(l.Uname) < 3 {
		return "密码的长度至少6个字符,用户名至少4个字符."
	}
	return ""
}
