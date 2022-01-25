package database

import (
	"golang/config"
	"golang/misc"
	"testing"
)

func TestSetupDbMysql(t *testing.T) {
	configFilePath := misc.GetConfigFilePath()
	config := config.ReadDbConfig(configFilePath)
	got := SetupDbMysql(config)

	// want := nil

	if got != nil {
		t.Errorf("got %q want nil", got)
	}

}
