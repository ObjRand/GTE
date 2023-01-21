extends Control

var current_file_path = ""
var current_file = "~"

func _ready():
	pass # Replace with function body.

func file_save(path):
	var file = File.new()
	file.open(path, File.WRITE)
	file.store_string($TextEdit.text)
	file.close()
	
func file_load(path):
	var file = File.new()
	file.open(path, File.READ)
	$TextEdit.text = file.get_as_text()
	file.close()

func _on_Save_pressed():
	if current_file_path != "":
		file_save(current_file_path)
	else:
		$Save.popup()

func _on_Open_pressed():
	$Open.popup()
	
func _on_SaveAs_pressed():
	$Save.popup()

func _on_Close_pressed():
	current_file_path = ""
	current_file = "~"
	$TextEdit.text = ""

func _on_Save_file_selected(path):
	print(path)
	
	current_file_path = path
	current_file = path
	
	file_save(current_file_path)

func _on_Open_file_selected(path):
	print(path)
	
	current_file_path = path
	current_file = path
	
	file_load(current_file_path)
	
func _process(delta):
	$Panel/FileName.text = current_file
