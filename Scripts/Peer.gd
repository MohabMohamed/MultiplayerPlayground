extends Control

var local_var:int 
var press_count:int = 0
# try change puppet to master 
puppet var puppet_var:int

func init(player_name):
	$PlayerName.text=player_name

func _ready():
	local_var=0
	puppet_var=0

func _process(delta):
	$LocalVar.text = 'local var : '+str(local_var)
	$PuppetVar.text = 'Puppet var : ' + str(puppet_var)

#try change remote to remotesync
remote func change_local(new_local):
	local_var = new_local

func _on_LocalTextEdit_text_entered(new_text):
	local_var=int(new_text)


func _on_PuppetTextEdit_text_entered(new_text):
	rset('puppet_var',int(new_text))


func _on_Button_pressed():
	press_count+=1
	rpc('change_local',press_count)
