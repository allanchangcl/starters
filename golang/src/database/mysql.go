package database

import (
	"database/sql"
	"fmt"
	"log"

	"golang/config"

	"github.com/go-sql-driver/mysql"
)

//
var db *sql.DB

func SetupDbMysql(config config.Config) error {
	fmt.Println("SetupDB called")
	// os.Setenv("DBUSER", "root")
	// os.Setenv("DBPASS", "Pass2020!")
	// os.Setenv("DBNAME", "golang")

	// cfg := mysql.Config{
	// 	User:   os.Getenv("DBUSER"),
	// 	Passwd: os.Getenv("DBPASS"),
	// 	Net:    "tcp",
	// 	Addr:   "127.0.0.1:3306",
	// 	DBName: os.Getenv("DBNAME"),
	// }

	cfg := mysql.Config{
		User:   config.DbUser,
		Passwd: config.DbPasswd,
		Net:    "tcp",
		Addr:   "127.0.0.1:3306",
		DBName: config.DbName,
	}

	// Open database connection
	var err error
	db, err = sql.Open("mysql", cfg.FormatDSN())

	// fmt.Printf("%+v\n", cfg)
	if err != nil {
		// return errors.New("database not implemented")
		// maybe log error
		return err
	}

	pingErr := db.Ping()
	if pingErr != nil {
		log.Fatal(pingErr)
	}
	fmt.Println("Connected!")

	return nil
}
