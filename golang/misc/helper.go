package misc

import "os"

func GetConfigFilePath() string {
	configFilePath := os.Getenv("CONFIG_PATH")
	if configFilePath == "" {
		panic("CONFIG_PATH is not set!")

	} else {
		info, err := os.Stat(configFilePath)
		if err != nil {
			panic(err)
		}
		if info.IsDir() {
			panic(configFilePath + " is a directory!")
		}
		return configFilePath
	}
}
