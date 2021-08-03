package flutter

import (
	"embed"
	"io/fs"
)

//go:embed starport_template/* starport_template/**
var app embed.FS

// Boilerplate is a flutter app starter for Cosmos SDK chains.
func Boilerplate() fs.FS {
	f, _ := fs.Sub(app, "starport_template")
	return f
}
