
extends CanvasLayer


func _ready() -> void:
    build_ui()


func build_ui() -> void:
    var background := ColorRect.new()
    background.color = Color(0.02, 0.04, 0.08, 0.65)
    background.set_anchors_and_offsets_preset(
        Control.PRESET_FULL_RECT
    )
    background.mouse_filter = Control.MOUSE_FILTER_IGNORE
    add_child(background)

    var title := Label.new()
    title.text = "AFTERTHEEND"
    title.position = Vector2(40, 35)
    title.add_theme_font_size_override("font_size", 36)
    title.add_theme_color_override(
        "font_color", Color("#e7edf7")
    )
    add_child(title)

    var tagline := Label.new()
    tagline.text = "SURVIVE THE UNKNOWN"
    tagline.position = Vector2(43, 82)
    tagline.add_theme_font_size_override("font_size", 13)
    tagline.add_theme_color_override(
        "font_color", Color("#92a6c5")
    )
    add_child(tagline)

    var menu := VBoxContainer.new()
    menu.position = Vector2(40, 530)
    menu.add_theme_constant_override("separation", 10)
    add_child(menu)

    add_menu_button(menu, "PLAY  -  COMING SOON")
    add_menu_button(menu, "CHARACTER  -  COMING SOON")
    add_menu_button(menu, "STORE  -  COMING SOON")

    var version := Label.new()
    version.text = "EARLY DEVELOPMENT BUILD"
    version.position = Vector2(40, 680)
    version.add_theme_font_size_override("font_size", 12)
    version.add_theme_color_override(
        "font_color", Color("#71819b")
    )
    add_child(version)


func add_menu_button(
    parent: VBoxContainer,
    button_text: String
) -> void:
    var button := Button.new()
    button.text = button_text
    button.custom_minimum_size = Vector2(270, 42)
    button.disabled = true
    parent.add_child(button)
