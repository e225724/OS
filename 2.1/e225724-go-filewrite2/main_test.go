package main_test

import (
	"testing"

	"gitlab.ie.u-ryukyu.ac.jp/os/2023/e225724-go-filewrite2/fileIO"
)

func Test_getOpts(t *testing.T) {
	type args struct {
		u fileIO.FileIO
	}

	var tests = []struct {
		name string
		args args
	}{
		{"test", args{fileIO.FileIO{FileName: "fileName", Buffering: false, BufferSize: 1024, WriteSize: 1024}}},
		//  {"test", args{fileIO.FileIO{"", false, 1024, 1024}}},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			tt.args.u.GetOpts()
			// testを失敗させる
			if tt.args.u.FileName != "expectedValue" {
				t.Fail()
			}
		})
	}
}
func Test_sub1(t *testing.T) {
	tests := []struct {
		name string
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
		})
	}
}
