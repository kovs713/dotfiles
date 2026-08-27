#!/usr/bin/env bash
set -euo pipefail

state_dir="${OMARCHY_STATE_DIR:-$HOME/.local/state/omarchy/current}"
theme_name="$(tr -d '\r\n' < "$state_dir/theme.name")"
colors_file="${3:-$state_dir/theme/colors.toml}"
out_dir="${1:-$HOME/.config/omarchy/generated/telegram-ios/$theme_name}"
out_file="${2:-$out_dir/$theme_name-ios.attheme}"

get_color() {
  local key=$1
  local fallback=$2
  local value

  value=$(awk -F= -v key="$key" '
    $1 ~ "^[[:space:]]*" key "[[:space:]]*$" {
      gsub(/[[:space:]"#]/, "", $2)
      print "#" tolower($2)
      exit
    }
  ' "$colors_file")

  printf '%s\n' "${value:-$fallback}"
}

mkdir -p "$out_dir" "$(dirname "$out_file")"

bg=$(get_color background '#000000')
fg=$(get_color foreground '#dadada')
accent=$(get_color active_border_color "$(get_color accent '#ffaf00')")
surface=$(get_color elevated "$(get_color selection_background '#1c1c1c')")
surface2=$(get_color subtle "$(get_color color8 '#303030')")
muted=$(get_color muted "$(get_color color1 '#707070')")
white=$(get_color color15 '#ffffff')
error=$(get_color error '#ff453a')
clear='clear'
overlay='#00000099'
dim='#00000066'
accent_soft="${accent}33"
accent_faint="${accent}14"
muted_alpha="${muted}99"

cat > "$out_file" <<THEME
name: $theme_name
shortname:
basedOn: night
dark: true
intro_statusBar: white
intro_primaryText: $fg
intro_accentText: $accent
intro_disabledText: $muted
intro_startButton: $accent
intro_dot: $surface2
passcode_bg_top: $surface
passcode_bg_bottom: $bg
passcode_button: $accent
root_statusBar: white
root_tabBar_background: $bg
root_tabBar_separator: $surface2
root_tabBar_icon: $muted
root_tabBar_selectedIcon: $accent
root_tabBar_text: $muted
root_tabBar_selectedText: $accent
root_tabBar_badgeBackground: $accent
root_tabBar_badgeStroke: $accent
root_tabBar_badgeText: $bg
root_navBar_button: $accent
root_navBar_disabledButton: $muted
root_navBar_primaryText: $fg
root_navBar_secondaryText: $muted
root_navBar_control: $muted
root_navBar_accentText: $accent
root_navBar_background: $bg
root_navBar_separator: $surface2
root_navBar_badgeFill: $accent
root_navBar_badgeStroke: $accent
root_navBar_badgeText: $bg
root_searchBar_background: $bg
root_searchBar_accent: $accent
root_searchBar_inputFill: $surface
root_searchBar_inputText: $fg
root_searchBar_inputPlaceholderText: $muted
root_searchBar_inputIcon: $muted
root_searchBar_inputClearButton: $muted
root_searchBar_separator: $surface2
root_keyboard: dark
list_blocksBg: $bg
list_plainBg: $bg
list_primaryText: $fg
list_secondaryText: $muted
list_disabledText: $muted
list_accent: $accent
list_highlighted: $accent
list_destructive: $error
list_placeholderText: $muted
list_itemBlocksBg: $surface
list_itemHighlightedBg: $surface2
list_blocksSeparator: $surface2
list_plainSeparator: $surface2
list_disclosureArrow: $muted
list_sectionHeaderText: $muted
list_freeText: $muted
list_freeTextError: $error
list_freeTextSuccess: $accent
list_freeMonoIcon: $muted
list_switch_frame: $surface2
list_switch_handle: $fg
list_switch_content: $accent
list_switch_positive: $accent
list_switch_negative: $error
list_disclosureActions_neutral1_bg: $surface2
list_disclosureActions_neutral1_fg: $fg
list_disclosureActions_neutral2_bg: $surface2
list_disclosureActions_neutral2_fg: $fg
list_disclosureActions_destructive_bg: $error
list_disclosureActions_destructive_fg: $white
list_disclosureActions_constructive_bg: $accent
list_disclosureActions_constructive_fg: $bg
list_disclosureActions_accent_bg: $accent
list_disclosureActions_accent_fg: $bg
list_disclosureActions_warning_bg: $accent
list_disclosureActions_warning_fg: $bg
list_disclosureActions_inactive_bg: $surface2
list_disclosureActions_inactive_fg: $muted
list_check_bg: $accent
list_check_stroke: $surface2
list_check_fg: $bg
list_controlSecondary: $surface2
list_freeInputField_bg: $surface
list_freeInputField_stroke: $surface2
list_freeInputField_placeholder: $muted
list_freeInputField_primary: $fg
list_freeInputField_control: $muted
list_mediaPlaceholder: $surface
list_scrollIndicator: $muted_alpha
list_pageIndicatorInactive: $surface2
list_inputClearButton: $muted
chatList_bg: $bg
chatList_itemSeparator: $surface2
chatList_itemBg: $bg
chatList_pinnedItemBg: $surface
chatList_itemHighlightedBg: $surface2
chatList_itemSelectedBg: $surface
chatList_title: $fg
chatList_secretTitle: $accent
chatList_dateText: $muted
chatList_authorName: $fg
chatList_messageText: $muted
chatList_messageHighlightedText: $fg
chatList_messageDraftText: $accent
chatList_checkmark: $accent
chatList_pendingIndicator: $muted
chatList_failedFill: $error
chatList_failedFg: $white
chatList_muteIcon: $muted
chatList_unreadBadgeActiveBg: $accent
chatList_unreadBadgeActiveText: $bg
chatList_unreadBadgeInactiveBg: $surface2
chatList_unreadBadgeInactiveText: $fg
chatList_pinnedBadge: $muted
chatList_pinnedSearchBar: $surface
chatList_regularSearchBar: $surface
chatList_sectionHeaderBg: $bg
chatList_sectionHeaderText: $muted
chatList_verifiedIconBg: $accent
chatList_verifiedIconFg: $bg
chatList_secretIcon: $accent
chatList_pinnedArchiveAvatar_background_top: $surface2
chatList_pinnedArchiveAvatar_background_bottom: $surface
chatList_pinnedArchiveAvatar_foreground: $fg
chatList_unpinnedArchiveAvatar_background_top: $surface2
chatList_unpinnedArchiveAvatar_background_bottom: $surface
chatList_unpinnedArchiveAvatar_foreground: $fg
chatList_onlineDot: $accent
wallpaper: $bg
chat_message_incoming_bubble_withWp_bg: $surface
chat_message_incoming_bubble_withWp_highlightedBg: $surface2
chat_message_incoming_bubble_withWp_stroke: $surface2
chat_message_incoming_bubble_withoutWp_bg: $surface
chat_message_incoming_bubble_withoutWp_highlightedBg: $surface2
chat_message_incoming_bubble_withoutWp_stroke: $surface2
chat_message_incoming_primaryText: $fg
chat_message_incoming_secondaryText: $muted_alpha
chat_message_incoming_linkText: $accent
chat_message_incoming_linkHighlight: $accent_soft
chat_message_incoming_scam: $error
chat_message_incoming_textHighlight: $accent
chat_message_incoming_accentText: $accent
chat_message_incoming_accentControl: $accent
chat_message_incoming_mediaActiveControl: $accent
chat_message_incoming_mediaInactiveControl: $muted
chat_message_incoming_pendingActivity: $muted_alpha
chat_message_incoming_fileTitle: $accent
chat_message_incoming_fileDescription: $muted
chat_message_incoming_fileDuration: $muted_alpha
chat_message_incoming_mediaPlaceholder: $surface2
chat_message_incoming_polls_radioButton: $muted
chat_message_incoming_polls_radioProgress: $accent
chat_message_incoming_polls_highlight: $accent_faint
chat_message_incoming_polls_separator: $surface2
chat_message_incoming_polls_bar: $accent
chat_message_incoming_actionButtonsBg_withWp: $overlay
chat_message_incoming_actionButtonsBg_withoutWp: $overlay
chat_message_incoming_actionButtonsStroke_withWp: $clear
chat_message_incoming_actionButtonsStroke_withoutWp: $clear
chat_message_incoming_actionButtonsText_withWp: $white
chat_message_incoming_actionButtonsText_withoutWp: $white
chat_message_incoming_textSelection: $accent_soft
chat_message_incoming_textSelectionKnob: $accent
chat_message_outgoing_bubble_withWp_bg: $surface2
chat_message_outgoing_bubble_withWp_highlightedBg: $surface
chat_message_outgoing_bubble_withWp_stroke: $surface2
chat_message_outgoing_bubble_withoutWp_bg: $surface2
chat_message_outgoing_bubble_withoutWp_highlightedBg: $surface
chat_message_outgoing_bubble_withoutWp_stroke: $surface2
chat_message_outgoing_primaryText: $fg
chat_message_outgoing_secondaryText: $muted_alpha
chat_message_outgoing_linkText: $accent
chat_message_outgoing_linkHighlight: $accent_soft
chat_message_outgoing_scam: $error
chat_message_outgoing_textHighlight: $accent
chat_message_outgoing_accentText: $accent
chat_message_outgoing_accentControl: $accent
chat_message_outgoing_mediaActiveControl: $accent
chat_message_outgoing_mediaInactiveControl: $muted
chat_message_outgoing_pendingActivity: $muted_alpha
chat_message_outgoing_fileTitle: $accent
chat_message_outgoing_fileDescription: $muted
chat_message_outgoing_fileDuration: $muted_alpha
chat_message_outgoing_mediaPlaceholder: $surface
chat_message_outgoing_polls_radioButton: $muted
chat_message_outgoing_polls_radioProgress: $accent
chat_message_outgoing_polls_highlight: $accent_faint
chat_message_outgoing_polls_separator: $surface2
chat_message_outgoing_polls_bar: $accent
chat_message_outgoing_actionButtonsBg_withWp: $overlay
chat_message_outgoing_actionButtonsBg_withoutWp: $overlay
chat_message_outgoing_actionButtonsStroke_withWp: $clear
chat_message_outgoing_actionButtonsStroke_withoutWp: $clear
chat_message_outgoing_actionButtonsText_withWp: $white
chat_message_outgoing_actionButtonsText_withoutWp: $white
chat_message_outgoing_textSelection: $accent_soft
chat_message_outgoing_textSelectionKnob: $accent
chat_message_freeform_withWp_bg: $surface
chat_message_freeform_withWp_highlightedBg: $surface2
chat_message_freeform_withWp_stroke: $surface2
chat_message_freeform_withoutWp_bg: $surface
chat_message_freeform_withoutWp_highlightedBg: $surface2
chat_message_freeform_withoutWp_stroke: $surface2
chat_message_infoPrimaryText: $fg
chat_message_infoLinkText: $accent
chat_message_outgoingCheck: $accent
chat_message_mediaDateAndStatusBg: $overlay
chat_message_mediaDateAndStatusText: $white
chat_message_shareButtonBg_withWp: $overlay
chat_message_shareButtonBg_withoutWp: $overlay
chat_message_shareButtonStroke_withWp: $clear
chat_message_shareButtonStroke_withoutWp: $clear
chat_message_shareButtonFg_withWp: $white
chat_message_shareButtonFg_withoutWp: $white
chat_message_mediaOverlayControl_bg: $overlay
chat_message_mediaOverlayControl_fg: $white
chat_message_selectionControl_bg: $accent
chat_message_selectionControl_stroke: $surface2
chat_message_selectionControl_fg: $bg
chat_message_deliveryFailed_bg: $error
chat_message_deliveryFailed_fg: $white
chat_message_mediaHighlightOverlay: $accent_soft
chat_serviceMessage_components_withDefaultWp_bg: $overlay
chat_serviceMessage_components_withDefaultWp_primaryText: $white
chat_serviceMessage_components_withDefaultWp_linkHighlight: $accent_soft
chat_serviceMessage_components_withDefaultWp_scam: $white
chat_serviceMessage_components_withDefaultWp_dateFillStatic: $overlay
chat_serviceMessage_components_withDefaultWp_dateFillFloat: $overlay
chat_serviceMessage_components_withCustomWp_bg: $overlay
chat_serviceMessage_components_withCustomWp_primaryText: $white
chat_serviceMessage_components_withCustomWp_linkHighlight: $accent_soft
chat_serviceMessage_components_withCustomWp_scam: $white
chat_serviceMessage_components_withCustomWp_dateFillStatic: $overlay
chat_serviceMessage_components_withCustomWp_dateFillFloat: $overlay
chat_serviceMessage_unreadBarBg: $surface
chat_serviceMessage_unreadBarStroke: $surface2
chat_serviceMessage_unreadBarText: $muted
chat_serviceMessage_dateText_withWp: $white
chat_serviceMessage_dateText_withoutWp: $white
chat_inputPanel_panelBg: $bg
chat_inputPanel_panelSeparator: $surface2
chat_inputPanel_panelControlAccent: $accent
chat_inputPanel_panelControl: $muted
chat_inputPanel_panelControlDisabled: $muted_alpha
chat_inputPanel_panelControlDestructive: $error
chat_inputPanel_inputBg: $surface
chat_inputPanel_inputStroke: $surface2
chat_inputPanel_inputPlaceholder: $muted
chat_inputPanel_inputText: $fg
chat_inputPanel_inputControl: $muted
chat_inputPanel_actionControlBg: $accent
chat_inputPanel_actionControlFg: $bg
chat_inputPanel_primaryText: $fg
chat_inputPanel_secondaryText: $muted
chat_inputPanel_mediaRecordDot: $error
chat_inputPanel_mediaRecordControl_button: $accent
chat_inputPanel_mediaRecordControl_micLevel: $accent_soft
chat_inputPanel_mediaRecordControl_activeIcon: $bg
chat_inputMediaPanel_panelSeparator: $surface2
chat_inputMediaPanel_panelIcon: $muted
chat_inputMediaPanel_panelHighlightedIconBg: $accent_soft
chat_inputMediaPanel_stickersBg: $bg
chat_inputMediaPanel_stickersSectionText: $muted
chat_inputMediaPanel_stickersSearchBg: $surface
chat_inputMediaPanel_stickersSearchPlaceholder: $muted
chat_inputMediaPanel_stickersSearchPrimary: $fg
chat_inputMediaPanel_stickersSearchControl: $muted
chat_inputMediaPanel_gifsBg: $bg
chat_inputButtonPanel_panelBg: $surface
chat_inputButtonPanel_panelSeparator: $surface2
chat_inputButtonPanel_buttonBg: $surface2
chat_inputButtonPanel_buttonStroke: $surface2
chat_inputButtonPanel_buttonHighlightedBg: $surface
chat_inputButtonPanel_buttonHighlightedStroke: $surface2
chat_inputButtonPanel_buttonText: $fg
chat_historyNav_bg: $surface
chat_historyNav_stroke: $surface2
chat_historyNav_fg: $muted
chat_historyNav_badgeBg: $accent
chat_historyNav_badgeStroke: $accent
chat_historyNav_badgeText: $bg
actionSheet_dim: $dim
actionSheet_bgType: dark
actionSheet_opaqueItemBg: $surface
actionSheet_itemBg: $surface
actionSheet_opaqueItemHighlightedBg: $surface2
actionSheet_itemHighlightedBg: $surface2
actionSheet_opaqueItemSeparator: $surface2
actionSheet_standardActionText: $accent
actionSheet_destructiveActionText: $error
actionSheet_disabledActionText: $muted
actionSheet_primaryText: $fg
actionSheet_secondaryText: $muted
actionSheet_controlAccent: $accent
actionSheet_inputBg: $surface2
actionSheet_inputHollowBg: $surface
actionSheet_inputBorder: $surface2
actionSheet_inputPlaceholder: $muted
actionSheet_inputText: $fg
actionSheet_inputClearButton: $muted
actionSheet_checkContent: $bg
contextMenu_dim: $dim
contextMenu_background: $surface
contextMenu_itemSeparator: $surface2
contextMenu_sectionSeparator: $surface2
contextMenu_itemBg: #00000000
contextMenu_itemHighlightedBg: $surface2
contextMenu_primary: $fg
contextMenu_secondary: $muted
contextMenu_destructive: $error
notification_bg: $surface
notification_primaryText: $fg
notification_expanded_bgType: dark
notification_expanded_navBar_background: $surface
notification_expanded_navBar_primaryText: $fg
notification_expanded_navBar_control: $muted
notification_expanded_navBar_separator: $surface2
THEME

printf '%s\n' "$out_file"
