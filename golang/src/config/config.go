package config

import (
	"encoding/json"
	"os"
)

type Config struct {
	DbDriver string `json:"db_driver"`
	DbHost   string `json:"db_host"`
	DbPort   string `json:"db_port"`
	DbUser   string `json:"db_user"`
	DbPasswd string `json:"db_passwd"`
	DbName   string `json:"db_name"`
}

func ReadDbConfig(inputConfigFile string) Config {
	configFile, err := os.Open(inputConfigFile)
	defer configFile.Close()
	if err != nil {
		panic("Error opening config file")
	}

	decoder := json.NewDecoder(configFile)
	var config Config
	err = decoder.Decode(&config)
	if err != nil {
		panic("Error decoding config file")
	}

	return config
}
