package utils

import (
	"math"
	"math/rand"
	"time"
)

const MAX_PERCENTAGE = 100

func Loop(process func(), percentage int64, delay int64) int {
	count := 0
	if IsInPercentage(percentage) {
		endMillis := time.Now().Local().Add(time.Millisecond * time.Duration(delay))
		for {
			process()
			count++
			if delay == 0 || time.Now().Local().After(endMillis) {
				break
			}
		}
	}
	return count
}

func IsInPercentage(percentage int64) bool {
	if percentage == MAX_PERCENTAGE {
		return true
	}
	return int64(math.Floor(rand.Float64()*MAX_PERCENTAGE)) < percentage

}
