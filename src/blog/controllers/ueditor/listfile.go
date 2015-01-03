package ueditor

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"sort"
)

type FileNode struct {
	Url string `json:"url"`
}

func ListFile(rootpath string) (list string) {
	var files []FileNode = make([]FileNode, 0, 10)
	afiles := listFiles(rootpath)

	// 遍历这些文件
	for _, filename := range afiles {
		// 拼接全路径
		fpath := filepath.Join("/", rootpath, filename)
		files = append(files, FileNode{fpath})
	}
	if len(files) > 0 {
		data, _ := json.Marshal(files)
		list = string(data)
	}
	fmt.Println(list)
	return list
}

func listFiles(dirname string) []string {
	f, _ := os.Open(dirname)

	names, _ := f.Readdirnames(-1)
	f.Close()

	sort.Strings(names)

	return names
}
