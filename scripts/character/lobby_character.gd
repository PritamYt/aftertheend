
extends Node3D

var rotation_speed: float = 0.35


func _ready() -> void:
    build_character()


func _process(delta: float) -> void:
    rotate_y(rotation_speed * delta)


func build_character() -> void:
    # Body
    create_capsule(
        Vector3(0, 1.25, 0),
        0.32, 1.0,
        Color("#34445c")
    )

    # Head
    create_sphere(
        Vector3(0, 2.0, 0),
        0.23,
        Color("#b9c5d6")
    )

    # Left arm
    create_capsule(
        Vector3(-0.43, 1.35, 0),
        0.12, 0.75,
        Color("#536782")
    )

    # Right arm
    create_capsule(
        Vector3(0.43, 1.35, 0),
        0.12, 0.75,
        Color("#536782")
    )

    # Left leg
    create_capsule(
        Vector3(-0.16, 0.42, 0),
        0.14, 0.8,
        Color("#202d40")
    )

    # Right leg
    create_capsule(
        Vector3(0.16, 0.42, 0),
        0.14, 0.8,
        Color("#202d40")
    )


func create_capsule(
    position: Vector3,
    radius: float,
    height: float,
    color: Color
) -> void:
    var mesh_instance := MeshInstance3D.new()
    var mesh := CapsuleMesh.new()

    mesh.radius = radius
    mesh.height = height

    mesh_instance.mesh = mesh
    mesh_instance.position = position
    mesh_instance.material_override = create_material(color)

    add_child(mesh_instance)


func create_sphere(
    position: Vector3,
    radius: float,
    color: Color
) -> void:
    var mesh_instance := MeshInstance3D.new()
    var mesh := SphereMesh.new()

    mesh.radius = radius
    mesh.height = radius * 2.0

    mesh_instance.mesh = mesh
    mesh_instance.position = position
    mesh_instance.material_override = create_material(color)

    add_child(mesh_instance)


func create_material(color: Color) -> StandardMaterial3D:
    var material := StandardMaterial3D.new()
    material.albedo_color = color
    material.metallic = 0.25
    material.roughness = 0.65
    return material
