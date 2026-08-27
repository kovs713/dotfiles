#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
state_dir="${OMARCHY_STATE_DIR:-$HOME/.local/state/omarchy/current}"
theme_name="$(tr -d '\r\n' < "$state_dir/theme.name")"
colors_file="${3:-$state_dir/theme/colors.toml}"
out_dir="${1:-$HOME/.config/omarchy/generated/telegram/$theme_name}"
out_file="${2:-$out_dir/$theme_name.tdesktop-theme}"

cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/telegram-theme-generator"
base_theme="$cache_dir/night.tdesktop-theme"
base_colors="$cache_dir/night.colors.tdesktop-theme"
base_url="https://raw.githubusercontent.com/telegramdesktop/tdesktop/dev/Telegram/Resources/night.tdesktop-theme"

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

mkdir -p "$cache_dir" "$out_dir" "$(dirname "$out_file")"

if [[ ! -s "$base_colors" ]]; then
  curl -fsSL "$base_url" -o "$base_theme"
  unzip -p "$base_theme" colors.tdesktop-theme > "$base_colors"
fi

bg=$(get_color background '#000000')
fg=$(get_color foreground '#dadada')
accent=$(get_color active_border_color "$(get_color accent '#ffaf00')")
accent_text=$(get_color background '#000000')
elevated=$(get_color elevated '#1c1c1c')
subtle=$(get_color subtle '#303030')
muted=$(get_color muted '#707070')
selection=$(get_color selection_background '#1c1c1c')
error=$(get_color error "$accent")

tmp_dir=$(mktemp -d)
cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT

awk \
  -v bg="$bg" \
  -v fg="$fg" \
  -v accent="$accent" \
  -v accent_text="$accent_text" \
  -v elevated="$elevated" \
  -v subtle="$subtle" \
  -v muted="$muted" \
  -v selection="$selection" \
  -v error="$error" '
function with_alpha(color, original, alpha) {
  alpha = ""
  if (original ~ /^#[0-9a-fA-F]{8}$/) {
    alpha = substr(original, 8, 2)
  }
  return color alpha
}

function themed(key, value, k) {
  k = tolower(key)

  if (k == "dialogsnamefgactive" || k == "dialogschaticonfgactive" || k == "dialogsdatefgactive" || k == "dialogstextfgactive" || k == "dialogsdraftfgactive" || k == "dialogssendingiconfgactive") {
    return with_alpha(fg, value)
  }

  if (k == "dialogsunreadfg" || k == "dialogsunreadfgover" || k == "dialogsunreadfgactive") {
    return with_alpha(accent_text, value)
  }

  if (k == "msginbgselected" || k == "msgoutbgselected" || k == "msgselectoverlay" || k == "msgstickeroverlay" || k == "msgservicebgselected") {
    return with_alpha(accent, value)
  }

  if (k == "historytextinfgselected" || k == "historytextoutfgselected" || k == "historylinkinfgselected" || k == "historylinkoutfgselected" || k == "historyfilenameinfgselected" || k == "historyfilenameoutfgselected" || k == "historyouticonfgselected" || k == "historycallarrowinfgselected" || k == "historycallarrowmissedinfgselected" || k == "historycallarrowoutfgselected" || k == "msginservicefgselected" || k == "msgoutservicefgselected" || k == "msgindatefgselected" || k == "msgoutdatefgselected" || k == "msginmonofgselected" || k == "msgoutmonofgselected" || k == "msginreplybarselcolor" || k == "msgoutreplybarselcolor" || k == "msgfilethumblinkinfgselected" || k == "msgfilethumblinkoutfgselected" || k == "mediainfgselected" || k == "mediaoutfgselected" || k == "msgwaveforminactiveselected" || k == "msgwaveformininactiveselected" || k == "msgwaveformoutactiveselected" || k == "msgwaveformoutinactiveselected") {
    return with_alpha(accent_text, value)
  }

  if (k ~ /(transparent|shadow|fade|layerbg|overlay|radialbg|toastbg|tooltipbg|dateimgbg|fingerprintbg|controlbg|captionbg)/) {
    return with_alpha(bg, value)
  }

  if (k ~ /(waveform.*inactive|statisticschartinactive)/) {
    return with_alpha(subtle, value)
  }

  if (k ~ /waveform.*active/) {
    return with_alpha(accent, value)
  }

  if (k ~ /(fg|text|name|date|status|description|caption|placeholder|icon|counterfg|badgefg|arrow|size)/) {
    if (k ~ /^dialogs(name|chaticon|date|text|draft|sendingicon)fgactive$/) {
      return with_alpha(fg, value)
    }

    if (k ~ /(activebuttonfg|windowfgactive|dialogsunreadfgactive|dialogsverifiediconfgactive|traycounterfg|userpicfg|mainmenucoverfg|callbarfg|historyunreadbarfg|overviewcheckfg|historyfile.*iconfg|historyfile.*radialfg|youtubeplayiconfg)/) {
      return with_alpha(accent_text, value)
    }

    if (k ~ /(attention|error|missed|hangup|draft|redcorner|youtube)/) {
      return with_alpha(error, value)
    }

    if (k ~ /(dialogstextfgserviceactive|dialogssenticonfgactive|dialogsonlinebadgefgactive|activelinefg|activetextfg|outlinebuttonoutlinefg|checkboxfg|overviewcheckfgactive|emojiiconfgactive|radialfg|progressfg|online|senticonfg|outiconfg|link.*fg|fglink|textfgservice|servicefg|monofg|profileadmin|sendiconfg|replyiconfg|mediaplayeractivefg|playbackactive|statisticschartactive)/) {
      return with_alpha(accent, value)
    }

    if (k ~ /(subtext|secondary|disabled|placeholder|datefg|statusfg|iconfg|cancelfg|closefg|separator|sending|inactive|muted|sizefg|additionalfg|descriptionfg|headerfg|scroll|category|categories|arrowfg|side.*textfg|side.*iconfg|borderfg)/) {
      return with_alpha(muted, value)
    }

    return with_alpha(fg, value)
  }

  if (k ~ /(attention|error|missed|hangup|closebgover|draft|redcorner|youtube)/) {
    return with_alpha(error, value)
  }

  if (k ~ /(dialogsbgactive|dialogsripplebgactive|dialogsforwardbg|notificationsboxscreenbg)/) {
    return with_alpha(subtle, value)
  }

  if (k ~ /(dialogsbgover|dialogsripplebg)/) {
    return with_alpha(elevated, value)
  }

  if (k ~ /(activebuttonbg|windowbgactive|sliderbgactive|traycounterbg|unreadbg|historyunreadbarbg|servicebgselected|replybar|msgfile.*bg|callanswer|callbarbg|cover|cloud|verifiediconbg|verifiedcheckbg|sidebarbadgebg|userpicbg|savedmessagesbg|playbackactive|statisticschartactive)/) {
    return with_alpha(accent, value)
  }

  if (k ~ /(selected|select)/) {
    return with_alpha(selection, value)
  }

  if (k ~ /^(windowbg|imagebg|lightbuttonbg|menubg|boxbg|boxsearchbg|contactsbg|introbg|dialogsbg|topbarbg|emojipanbg|emojipancategories|historycomposeareabg|historyreplybg|historycomposebuttonbg|mainmenubg|mediaplayerbg|notificationbg|sidebarbg|mediaviewfilebg)$/) {
    return with_alpha(bg, value)
  }

  if (k ~ /^msginbg$/) {
    return with_alpha(elevated, value)
  }

  if (k ~ /^msgoutbg$/) {
    return with_alpha(subtle, value)
  }

  if (k ~ /(bg|background|border|line|bar|area|pan|menu|box|contacts|dialogs|input|button|slider|thumb|ripple)/) {
    if (k ~ /(over|ripple|active|down|hover|inactive)/) {
      return with_alpha(subtle, value)
    }
    return with_alpha(elevated, value)
  }

  return value
}

/^[A-Za-z0-9_]+:[[:space:]]*/ {
  key = $0
  sub(/:.*/, "", key)

  value = $0
  sub(/^[A-Za-z0-9_]+:[[:space:]]*/, "", value)
  sub(/;.*/, "", value)
  gsub(/[[:space:]]/, "", value)

  comment = $0
  if (comment ~ /;/) {
    sub(/^[^;]*;/, "", comment)
  } else {
    comment = ""
  }

  print key ": " themed(key, value) ";" comment
  next
}

{ print }
' "$base_colors" > "$tmp_dir/colors.tdesktop-theme"

if command -v magick >/dev/null 2>&1; then
  magick -size 1x1 "xc:$bg" -alpha opaque "PNG32:$tmp_dir/background.png"
elif command -v convert >/dev/null 2>&1; then
  convert -size 1x1 "xc:$bg" -alpha opaque "PNG32:$tmp_dir/background.png"
elif [[ "$bg" == "#000000" ]]; then
  printf 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYGD4DwABBAEAgh8H7gAAAABJRU5ErkJggg==' | base64 -d > "$tmp_dir/background.png"
else
  echo "ImageMagick required to generate Telegram background for $bg" >&2
  exit 1
fi

rm -f "$out_file"
(cd "$tmp_dir" && zip -X -q -9 "$out_file" colors.tdesktop-theme background.png)

printf '%s\n' "$out_file"
