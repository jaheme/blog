package models

import (
	"time"
)

type Message struct {
	Id         int32
	Uname      string
	Email      string
	Phone      string
	Message    string
	CreateTime time.Time
}
