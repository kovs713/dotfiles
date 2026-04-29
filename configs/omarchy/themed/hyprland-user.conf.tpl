$activeBorderColor = rgb({{ active_border_color_strip }})

general {
    col.active_border = rgba({{ background_strip }}ee) rgba({{ accent_strip }}ee) 45deg
    col.inactive_border = rgb({{ color8_strip }})
}

group {
    col.border_active = $activeBorderColor
}
