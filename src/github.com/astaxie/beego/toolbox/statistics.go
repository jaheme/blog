// Copyright 2014 beego Author. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package toolbox

import (
	"fmt"
	"sync"
	"time"
)

// Statistics struct
type Statistics struct {
	RequestUrl        string
	RequestController string
	RequestNum        int64
	MinTime           time.Duration
	MaxTime           time.Duration
	TotalTime         time.Duration
}

// UrlMap contains several statistics struct to log different data
type UrlMap struct {
	lock        sync.RWMutex
	LengthLimit int //limit the urlmap's length if it's equal to 0 there's no limit
	urlmap      map[string]map[string]*Statistics
}

// add statistics task.
// it needs request method, request url, request controller and statistics time duration
func (m *UrlMap) AddStatistics(requestMethod, requestUrl, requestController string, requesttime time.Duration) {
	m.lock.Lock()
	defer m.lock.Unlock()
	if method, ok := m.urlmap[requestUrl]; ok {
		if s, ok := method[requestMethod]; ok {
			s.RequestNum += 1
			if s.MaxTime < requesttime {
				s.MaxTime = requesttime
			}
			if s.MinTime > requesttime {
				s.MinTime = requesttime
			}
			s.TotalTime += requesttime
		} else {
			nb := &Statistics{
				RequestUrl:        requestUrl,
				RequestController: requestController,
				RequestNum:        1,
				MinTime:           requesttime,
				MaxTime:           requesttime,
				TotalTime:         requesttime,
			}
			m.urlmap[requestUrl][requestMethod] = nb
		}

	} else {
		if m.LengthLimit > 0 && m.LengthLimit <= len(m.urlmap) {
			return
		}
		methodmap := make(map[string]*Statistics)
		nb := &Statistics{
			RequestUrl:        requestUrl,
			RequestController: requestController,
			RequestNum:        1,
			MinTime:           requesttime,
			MaxTime:           requesttime,
			TotalTime:         requesttime,
		}
		methodmap[requestMethod] = nb
		m.urlmap[requestUrl] = methodmap
	}
}

// put url statistics result in io.Writer
func (m *UrlMap) GetMap() [][]string {
	m.lock.RLock()
	defer m.lock.RUnlock()
	resultLists := make([][]string, 0)

	var result = []string{"requestUrl", "method", "times", "used", "max used", "min used", "avg used"}
	resultLists = append(resultLists, result)
	for k, v := range m.urlmap {
		for kk, vv := range v {
			result := []string{
				fmt.Sprintf("% -50s", k),
				fmt.Sprintf("% -10s", kk),
				fmt.Sprintf("% -16d", vv.RequestNum),
				fmt.Sprintf("% -16s", toS(vv.TotalTime)),
				fmt.Sprintf("% -16s", toS(vv.MaxTime)),
				fmt.Sprintf("% -16s", toS(vv.MinTime)),
				fmt.Sprintf("% -16s", toS(time.Duration(int64(vv.TotalTime)/vv.RequestNum))),
			}
			resultLists = append(resultLists, result)
		}
	}
	return resultLists
}

// global statistics data map
var StatisticsMap *UrlMap

func init() {
	StatisticsMap = &UrlMap{
		urlmap: make(map[string]map[string]*Statistics),
	}
}
