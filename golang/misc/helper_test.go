package misc

import "testing"

// Test .
func TestGetConfigFilePath(t *testing.T) {
	got := GetConfigFilePath()
	want := "../config.json"

	if got != want {
		t.Errorf("got %q want %q", got, want)
	}

}
