package fileIO

import (
	"io/ioutil"
	"os"
	"fmt"
)

type FileIO struct {
	FileName   string
	Buffering  bool
	BufferSize int
	WriteSize  int
}

func NewFileIO(fileName string, buffering bool, bufferSize, writeSize int) *FileIO {
	return &FileIO{
		FileName:   fileName,
		Buffering:  buffering,
		BufferSize: bufferSize,
		WriteSize:  writeSize,
	}
}

func (f *FileIO) ReadFile() ([]byte, error) {
	content, err := ioutil.ReadFile(f.FileName)
	if err != nil {
		return nil, err
	}
	return content, nil
}
func (f *FileIO) WriteFile(data []byte) error {
	flag := os.O_WRONLY | os.O_CREATE
	if f.Buffering {
		flag |= os.O_APPEND
	} else {
		flag |= os.O_TRUNC
	}

	file, err := os.OpenFile(f.FileName, flag, 0644)
	if err != nil {
		return err
	}
	defer file.Close()

	_, err = file.Write(data)
	if err != nil {
		return err
	}

	return nil
}

func (f *FileIO) GetOpts() {
	fmt.Printf("FileName: %s, Buffering: %t, BufferSize: %d, WriteSize: %d\n",
		f.FileName, f.Buffering, f.BufferSize, f.WriteSize)
}

