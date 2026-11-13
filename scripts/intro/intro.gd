
extends Control

var title_label: Label
var subtitle_label: Label
var loading_bar: ProgressBar
var fade_layer: ColorRect


func _ready() -> void:
    build_intro()
    play_intro()


func build_intro() -> void:
    var background := ColorRect.new()
    background.color = Color("#080d18")
    background.set_anchors_and_offsets_preset(
        Control.PRESET_FULL_RECT
    )
    add_child(background)

    var center := CenterContainer.new()
    center.set_anchors_and_offsets_preset(
        Control.PRESET_FULL_RECT
    )
    add_child(center)

    var content := VBoxContainer.new()
    content.alignment = BoxContainer.ALIGNMENT_CENTER
    content.add_theme_constant_override("separation", 18)
    center.add_child(content)

    title_label = Label.new()
    title_label.text = "AFTERTHEEND"
    title_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    title_label.add_theme_font_size_override("font_size", 56)
    title_label.add_theme_color_override(
        "font_color", Color("#e7edf7")
    )
    content.add_child(title_label)

    subtitle_label = Label.new()
    subtitle_label.text = "THE WORLD HAS CHANGED"
    subtitle_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    subtitle_label.add_theme_font_size_override("font_size", 16)
    subtitle_label.add_theme_color_override(
        "font_color", Color("#8295b2")
    )
    content.add_child(subtitle_label)

    loading_bar = ProgressBar.new()
    loading_bar.custom_minimum_size = Vector2(300, 12)
    loading_bar.min_value = 0
    loading_bar.max_value = 100
    loading_bar.value = 0
    loading_bar.show_percentage = false
    content.add_child(loading_bar)

    fade_layer = ColorRect.new()
    fade_layer.color = Color.BLACK
    fade_layer.set_anchors_and_offsets_preset(
        Control.PRESET_FULL_RECT
    )
    fade_layer.mouse_filter = Control.MOUSE_FILTER_IGNORE
    fade_layer.modulate.a = 0.0
    add_child(fade_layer)


func play_intro() -> void:
    title_label.modulate.a = 0.0
    subtitle_label.modulate.a = 0.0

    var intro_tween := create_tween()
    intro_tween.tween_property(
        title_label, "modulate:a", 1.0, 1.5
    )
    intro_tween.parallel().tween_property(
        subtitle_label, "modulate:a", 1.0, 2.0
    )

    await intro_tween.finished

    await get_tree().create_timer(0.5).timeout

    var loading_tween := create_tween()
    loading_tween.tween_property(
        loading_bar, "value", 100.0, 2.5
    )

    await loading_tween.finished

    await get_tree().create_timer(0.4).timeout

    var fade_tween := create_tween()
    fade_tween.tween_property(
        fade_layer, "modulate:a", 1.0, 0.8
    )

    await fade_tween.finished

    get_tree().change_scene_to_file(
        "res://scenes/lobby/lobby.tscn"
    )
