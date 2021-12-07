CONFIG_PATH=config go test ./...
CONFIG_PATH=config go test misc/*.go
CONFIG_PATH=../config.json go test -v ./misc -run "^TestGetConfigFilePath$"
CONFIG_PATH=../config/config.json go test -v ./misc -run "^TestGetConfigFilePath$"
