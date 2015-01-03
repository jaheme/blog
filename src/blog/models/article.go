package models

import (
	"time"
)

type Article struct {
	Id          int32
	UserId      int32
	Title       string
	Tags        string
	Url         string
	Category    int32
	Status      int32
	Create_time time.Time
	Commends    int32
	Content     string
}

func (this *Article) Check() string {
	if this.Title == "" {
		return "Title not be blank"
	}
	if this.Content == "" {
		return "Content not be blank"
	}
	return ""
}
