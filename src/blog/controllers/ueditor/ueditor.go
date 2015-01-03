package ueditor

import (
	"fmt"
	"github.com/astaxie/beego"
	"github.com/bitly/go-simplejson"
	"io/ioutil"
	"os"
	"strings"
	"time"
)

var (
	cjson  *simplejson.Json
	config string
)

type UeditorController struct {
	beego.Controller
}

func (u *UeditorController) Get() {
	action := u.GetString("action")
	if action == "config" {
		if cjson == nil {
			initConfig()
		}
		u.Ctx.WriteString(config)
		return
	} else if action == "listimage" {
		listImage(u)
		return
	}
	beego.Warn("action name:", action)
}

func (u *UeditorController) Post() {
	action := u.GetString("action")
	if action == "uploadimage" {
		uploadImage(u)
		return
	}
}

//上传文件
func uploadImage(this *UeditorController) {
	_, header, err := this.GetFile("upfile")
	ext := strings.ToLower(header.Filename[strings.LastIndex(header.Filename, "."):])
	out := make(map[string]string)
	out["url"] = ""
	out["fileType"] = ext
	out["original"] = header.Filename
	out["state"] = "SUCCESS"
	if err != nil {
		out["state"] = err.Error()
	} else {
		savepath, _ := cjson.Get("imagePathFormat").String()
		if err := os.MkdirAll(savepath, os.ModePerm); err != nil {
			out["state"] = err.Error()
			beego.Error("MkdirAll-", err.Error())
		} else {
			filename := fmt.Sprintf("%s/%d%s", savepath, time.Now().UnixNano(), ext)
			if err := this.SaveToFile("upfile", filename); err != nil {
				out["state"] = err.Error()
				beego.Error("SaveToFile-", err.Error())
			} else {
				out["url"] = filename[1:]
			}
		}
	}

	this.Data["json"] = out
	this.ServeJson()
}

func listImage(this *UeditorController) {
	start := this.GetString("start")
	rootpath, _ := cjson.Get("imagePathFormat").String()
	filelist := ListFile(rootpath)
	out := make(map[string]string)
	out["list"] = filelist
	out["total"] = "20"
	out["start"] = start
	out["state"] = "SUCCESS"
	this.Data["json"] = out
	this.ServeJson()
}

func initConfig() {
	bytes, ierr := ioutil.ReadFile(beego.AppPath + "/controllers/ueditor/config.json")
	if ierr != nil {
		beego.Error(ierr.Error())
		return
	}
	j, jerr := simplejson.NewJson(bytes)
	if jerr == nil {
		cjson = j
	} else {
		beego.Error(jerr.Error())
	}
	config = string(bytes)
}
