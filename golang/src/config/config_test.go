package config

import (
	"golang/misc"
	"reflect"
	"testing"
)

// Test .
func TestReadDbConfig(t *testing.T) {
	configFilePath := misc.GetConfigFilePath()
	// println(configFilePath)
	config := ReadDbConfig(configFilePath)
	got := reflect.TypeOf(config).String()
	// fmt.Printf("%+v\n", ok)
	// fmt.Printf("%+v\n", got)
	// fmt.Println("type: ", reflect.TypeOf(got))
	want := "config.Config"

	if got != want {
		t.Errorf("got %q want %q", got, want)
	}
}
