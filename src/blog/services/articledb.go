package services

import (
	"blog/models"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

const (
	PAGE_SIZE int = 10
)

func SaveArticle(a *models.Article) error {
	sql := "INSERT INTO article SET title=?, user_id=?, tags=?, url=?, category=?,status=?,create_time=?"
	db := orm.NewOrm()
	result, err := db.Raw(sql, a.Title, a.UserId, a.Tags, a.Url, a.Category, a.Status, a.Create_time).Exec()
	if err != nil {
		beego.Error(err.Error())
		return err
	}
	id, err := result.LastInsertId()
	if err != nil {
		beego.Error(err.Error())
		return err
	}
	beego.Info("article save ok.")
	sql = "INSERT INTO article_text SET article_id=?, content=?"
	_, err1 := db.Raw(sql, id, a.Content).Exec()
	if err1 != nil {
		beego.Error(err1.Error())
		db.Raw("DELETE FROM article WHERE id=?", id).Exec()
		return err1
	}
	return nil
}

func UpdateArticle(a *models.Article) error {
	sql := "UPDATE article SET title=?, user_id=?, tags=?, url=?, category=?,status=? WHERE id=?"
	db := orm.NewOrm()
	_, err := db.Raw(sql, a.Title, a.UserId, a.Tags, a.Url, a.Category, a.Status, a.Id).Exec()
	if err != nil {
		beego.Error(err.Error())
		return err
	}
	sql = "UPDATE article_text SET content=? WHERE article_id=?"
	_, err1 := db.Raw(sql, a.Content, a.Id).Exec()
	if err1 != nil {
		beego.Error(err1.Error())
		return err1
	}
	return nil
}

func ListArticle() (as []models.Article) {
	sql := "select a.*, at.content from article a, article_text at where a.id=at.article_id order by id desc"
	db := orm.NewOrm()
	_, err := db.Raw(sql).QueryRows(&as)
	if nil != err {
		beego.Error(err)
	}
	return
}

func OptArticle(id int64, opt_type string) error {
	var sql string = ""
	if opt_type == "del" {
		return delArticle(id)
	} else if opt_type == "draft" {
		sql = "update article set status = 1 where id=?"
	} else if opt_type == "pub" {
		sql = "update article set status = 0 where id=?"
	}
	db := orm.NewOrm()
	_, err := db.Raw(sql, id).Exec()
	if nil != err {
		beego.Error(err)
	}
	return err
}

func delArticle(id int64) error {
	sql := "delete from article where id=?"
	sqlT := "delete from article_text where article_id=?"
	db := orm.NewOrm()
	_, err := db.Raw(sql, id).Exec()
	if nil != err {
		beego.Error(err)
		return err
	}
	_, err = db.Raw(sqlT, id).Exec()
	return err
}

func GetArticle(url string) (article models.Article) {
	sql := "select a.*, at.content from article a, article_text at where a.id=at.article_id and a.url=?"
	db := orm.NewOrm()
	err := db.Raw(sql, url).QueryRow(&article)
	if nil != err {
		beego.Error(err)
	}
	return
}

func GetArticleById(id string) (article models.Article) {
	sql := "select a.*, at.content from article a, article_text at where a.id=at.article_id and a.id=?"
	db := orm.NewOrm()
	err := db.Raw(sql, id).QueryRow(&article)
	if nil != err {
		beego.Error(err)
	}
	return
}

// for index.
func GetArticles(page int) (as []models.Article) {
	start := page * PAGE_SIZE
	sql := "select a.title, a.url, a.create_time, a.category, left(at.content,800) content" +
		" from article a, article_text at" +
		" where a.id=at.article_id order by id desc limit ?, ?"
	db := orm.NewOrm()
	_, err := db.Raw(sql, start, PAGE_SIZE).QueryRows(&as)
	if nil != err {
		beego.Error(err)
	}
	return
}
