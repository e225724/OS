package main
import (
            "ie.u-ryukyu.ac.jp/teacher/kono/os/fileWrite2/fileIO"
            "testing"
    )
    func Test_getOpts(t *testing.T) {
            type args struct {
                    u fileIO.FileIO
            }
            // u1 := fileIO.FileIO{}
            var tests = []struct {
                    name string
                    args args
            }{
                    {"test", args{fileIO.FileIO{"fileName", false, 1024, 1024}}},
            //      {"test", args{fileIO.FileIO{"", false, 1024, 1024}}},
            }
            for _, tt := range tests {
                    t.Run(tt.name, func(t *testing.T) {
                            getOpts(& tt.args.u)
                            if tt.args.u.FileName == "" {
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
