extends Control

func _ready():
	get_tree().connect('network_peer_disconnected', self, '_on_player_disconnected')
	get_tree().connect('server_disconnected', self, '_on_server_disconnected')
	
	var new_player = preload('res://Scenes/Peer.tscn').instance()
	new_player.name = str(get_tree().get_network_unique_id())
	new_player.set_network_master(get_tree().get_network_unique_id())
	$HBoxContainer.add_child(new_player)
	var info = Network.self_data
	new_player.init(info.name)

func _on_player_disconnected(id):
	$HBoxContainer.get_node(str(id)).queue_free()

func _on_server_disconnected():
	get_tree().change_scene('res://Scenes/Lobby.tscn')