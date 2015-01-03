package admin

import (
	"blog/models"
	"blog/services"
	"github.com/astaxie/beego"
	"time"
)

type ArticleController struct {
	beego.Controller
}

func (a *ArticleController) checkLogin() int32 {
	auser := a.GetSession("auser")
	if nil != auser {
		user := auser.(models.User)
		if user.IsAdmin == true {
			return user.Id
		}
	}
	return 0
}

func (this *ArticleController) Get() {
	this.TplNames = "admin/article.tpl"
}

func (this *ArticleController) Save() {
	uid := this.checkLogin()
	if uid == 0 {
		this.TplNames = "admin/alogin.tpl"
		return
	}
	st, _ := this.GetInt("status")
	category, _ := this.GetInt("category")
	at := &models.Article{
		Title:       this.GetString("rtitle"),
		Tags:        this.GetString("tags"),
		Url:         this.GetString("url"),
		Category:    int32(category),
		Status:      int32(st),
		Content:     this.GetString("content"),
		Create_time: time.Now(),
		UserId:      uid,
	}

	var msg string = at.Check()
	if msg != "" {
		this.Ctx.WriteString(msg)
		return
	}
	err := services.SaveArticle(at)
	if err != nil {
		this.Ctx.WriteString(err.Error())
		return
	}

	this.Ctx.WriteString("0")
	return
}

func (this *ArticleController) List() {
	as := services.ListArticle()
	this.Data["as"] = as
	this.TplNames = "admin/article_list.tpl"
}

// del, draft
func (this *ArticleController) Operation() {
	opt_type := this.GetString("type")
	id, _ := this.GetInt("id")
	err := services.OptArticle(id, opt_type)
	if nil == err {
		this.List()
	}
}
