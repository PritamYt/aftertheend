
extends Node3D

const CHARACTER_SCRIPT = preload(
    "res://scripts/character/lobby_character.gd"
)

const UI_SCRIPT = preload(
    "res://scripts/ui/lobby_ui.gd"
)


func _ready() -> void:
    create_world()
    create_camera()
    create_character()
    create_lobby_ui()


func create_world() -> void:
    var world_environment := WorldEnvironment.new()
    var environment := Environment.new()

    environment.background_mode = Environment.BG_SKY
    environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
    environment.ambient_light_color = Color("#53647d")
    environment.ambient_light_energy = 0.55

    world_environment.environment = environment
    add_child(world_environment)

    var light := DirectionalLight3D.new()
    light.rotation_degrees = Vector3(-45, -30, 0)
    light.light_energy = 1.3
    add_child(light)

    var floor := MeshInstance3D.new()
    var floor_mesh := PlaneMesh.new()
    floor_mesh.size = Vector2(30, 30)

    floor.mesh = floor_mesh

    var floor_material := StandardMaterial3D.new()
    floor_material.albedo_color = Color("#101b2b")
    floor_material.metallic = 0.35
    floor_material.roughness = 0.8

    floor.material_override = floor_material
    floor.position.y = -0.03
    add_child(floor)


func create_camera() -> void:
    var camera := Camera3D.new()

    camera.position = Vector3(0, 2.6, 6.5)
    camera.look_at(Vector3(0, 1.15, 0))

    camera.current = true
    add_child(camera)


func create_character() -> void:
    var character := Node3D.new()
    character.set_script(CHARACTER_SCRIPT)

    add_child(character)
    character.position = Vector3(0, 0, 0)


func create_lobby_ui() -> void:
    var lobby_ui := CanvasLayer.new()
    lobby_ui.set_script(UI_SCRIPT)
    add_child(lobby_ui)
