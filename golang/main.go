package main

import (
	"errors"
	"fmt"
	"golang/database"
	"os"
)

func main() {
	if err := run(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}

func run() error {
	dbErr := database.SetupDB()

	// fmt.Printf("%+v\n", dbErr)

	if dbErr != nil {
		// return dbErr
		return errors.New("run: database server not implemented")
		// return dbErr
	}

	srvErr := setupServer()
	if srvErr != nil {
		return srvErr
	}
	return nil
}

func setupServer() error {
	// return errors.New("server not implemented")
	return nil
}
