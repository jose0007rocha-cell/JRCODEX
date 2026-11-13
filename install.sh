#!/bin/bash
clear
if [ -d "/data/data/com.termux/files/usr/" ]; then
    if [ -d "$HOME/.toolx" ]; then
        chmod -R 777 "$HOME/.toolx" 2>/dev/null
        rm -rf "$HOME/.toolx" 2>/dev/null
    fi
else
    if [ -d "$HOME/.toolx" ]; then
        chmod -R 777 "$HOME/.toolx" 2>/dev/null
        rm -rf "$HOME/.toolx" 2>/dev/null
        if [ -d "$HOME/.toolx" ] && command -v sudo >/dev/null 2>&1; then
            sudo chmod -R 777 "$HOME/.toolx" 2>/dev/null
            sudo rm -rf "$HOME/.toolx" 2>/dev/null
        fi
    fi
fi
mkdir -p "$HOME/.JRCODEX"
mkdir -p "$HOME/.JRCodex-simu"
mkdir -p "$HOME/.jrcodex"
# dx colors
r='\033[1;91m'
p='\033[1;95m'
y='\033[1;93m'
g='\033[1;92m'
n='\033[1;00m'
b='\033[1;94m'
c='\033[1;96m'

# dx Symbol
X='\033[1;92m[\033[1;00m⎯꯭̽𓆩\033[1;92m]\033[1;96m'
# icone por plataforma
if [ -d "/data/data/com.termux/files/usr/" ]; then
    icon="〄"
else
    icon="ଲ"
fi

D='\033[1;92m[\033[1;00m'$icon'\033[1;92m]\033[1;93m'
E='\033[1;92m[\033[1;00m×\033[1;92m]\033[1;91m'
A='\033[1;92m[\033[1;00m+\033[1;92m]\033[1;92m'
C='\033[1;92m[\033[1;00m</>\033[1;92m]\033[92m'
lm='\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m'$icon'\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'
dm='\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m'$icon'\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'

# dx icon
OS="\uf6a6"
HOST="\uf6c3"
KER="\uf83c"
UPT="\uf49b"
PKGS="\uf8d6"
SH="\ue7a2"
TERMINAL="\uf489"
CHIP="\uf2db"
CPUI="\ue266"
HOMES="\uf015"


# Device Detection
if command -v getprop &>/dev/null; then
    MODEL=$(getprop ro.product.model)
    VENDOR=$(getprop ro.product.manufacturer)
else
    MODEL=$(uname -n)
    VENDOR=$(uname -s)
fi
devicename="${VENDOR} ${MODEL}"
THRESHOLD=100
random_number=$(( RANDOM % 2 ))

if [ -d "/data/data/com.termux/files/usr/" ]; then
   
    exit_script() {
        clear
        echo
        echo
        echo -e ""
        echo -e "${c}              (\_/)"
        echo -e "              (${y}^_^${c})     ${A} ${g}Hey dear${c}"
        echo -e "             ⊂(___)づ  ⋅˚₊‧ ଳ ‧₊˚ ⋅"              
        echo -e "\n ${g}[${n}${KER}${g}] ${c}Exiting ${g}JRCodex Banner \033[1;36m"
        echo
        cd "$HOME"
        rm -rf "$HOME/JRCODEX" >/dev/null 2>&1
        kill -9 $PPID 2>/dev/null
        exit 0
    }
else
    # evita mensagens de killed
    exit_script() {
        trap - SIGINT SIGTSTP EXIT
        clear
        echo
        echo
        echo -e ""
        echo -e "${c}              (\_/)"
        echo -e "              (${y}^_^${c})     ${A} ${g}Hey dear${c}"
        echo -e "             ⊂(___)づ  ⋅˚₊‧ ଳ ‧₊˚ ⋅"              
        echo -e "\n ${g}[${n}${KER}${g}] ${c}Exiting ${g}JRCodex Banner \033[1;36m"
        echo
        cd "$HOME"
        rm -rf "$HOME/JRCODEX" >/dev/null 2>&1
        pkill -P $$ >/dev/null 2>&1
        exec 2>/dev/null
        exit 0
    }
fi
if command -v tput &>/dev/null; then
    echo ""
else
    echo -e " ${C} ${g}Waiting for setup Screen!¡${n}"
    if [ -d "/data/data/com.termux/files/usr/" ]; then
        pkg install ncurses-utils -y >/dev/null 2>&1
    else
        sudo apt install ncurses-bin -y >/dev/null 2>&1 || true
    fi
    clear
fi

if command -v curl &>/dev/null; then
    echo ""
else
    if [ -d "/data/data/com.termux/files/usr/" ]; then
        pkg install curl -y >/dev/null 2>&1
    else
        sudo apt install curl -y >/dev/null 2>&1 || true
    fi
    clear
fi

trap exit_script SIGINT SIGTSTP

check_disk_usage() {
    local threshold=${1:-$THRESHOLD}
    local total_size=$(df -h "$HOME" | awk 'NR==2 {print $2}')
    local used_size=$(df -h "$HOME" | awk 'NR==2 {print $3}')
    local disk_usage=$(df "$HOME" | awk 'NR==2 {print $5}' | sed 's/%//g')

    if [ "$disk_usage" -ge "$threshold" ]; then
        echo -e "${g}[${n}\uf0a0${g}] ${r}WARN: ${y}Disk Full ${g}${disk_usage}% ${c}| ${c}U${g}${used_size} ${c}of ${c}T${g}${total_size}"
    else
        echo -e "${y}Disk usage: ${g}${disk_usage}% ${c}| ${g}${used_size}"
    fi
}
data=$(check_disk_usage)

start() {
    clear
    tput civis
    LIME='\e[38;5;154m'
    C='\e[38;5;51m'
    BLINK='\e[5m'
    N='\e[0m'
    TOTAL_CHARS=0
    texts=(
        "「 JRCODEX STARTED 」"
        "「 HELLO DEAR USER I'M DX-SIMU 」"
        "「 JRCODEX WILL PROTECT YOU 」"
        "「 GOODBYE 」"
        "「 ENJOY OUR JRCODEX 」"
        "「............... 」"
    )
    for t in "${texts[@]}"; do
        TOTAL_CHARS=$((TOTAL_CHARS + ${#t}))
    done
    CURRENT_CHAR=0
    update_progress() {
        local percentage=$(( CURRENT_CHAR * 100 / TOTAL_CHARS ))
        if [ "$percentage" -gt 100 ]; then percentage=100; fi
        local term_width=$(tput cols)
        local bar_width=$((term_width - 20))
        if [ "$bar_width" -gt 50 ]; then bar_width=50; fi
        local padding=$(( (term_width - bar_width - 10) / 2 ))
        local filled=$(( percentage * bar_width / 100 ))
        local empty=$(( bar_width - filled ))
        local f_bar=$(printf "%${filled}s" "")
        local e_bar=$(printf "%${empty}s" "")
        tput sc
        tput cup 2 0
        tput el
        printf "%${padding}s${LIME}[\e[48;5;154m%s\e[0m\e[48;5;236m%s\e[0m${LIME}] ${C}%3d%%${N}" "" "$f_bar" "$e_bar" "$percentage"
        tput rc
    }
    type_effect() {
        local text="$1"
        local delay="$2"
        local term_width=$(tput cols)
        local text_length=${#text}
        local padding=$(( (term_width - text_length) / 2 ))
        printf "%${padding}s" ""
        for ((i=0; i<${#text}; i++)); do
            CURRENT_CHAR=$((CURRENT_CHAR + 1))
            update_progress
            printf "${LIME}${BLINK}${text:$i:1}${N}"
            if (( RANDOM % 1 == 0 )); then
                printf "\e[48;5;51m \e[0m"
                printf "\b \b"
            fi
            sleep "$delay"
        done
        echo
        echo
    }
    tput cup 5 0
    type_effect "${texts[0]}" 0.01
    sleep 0.1
    type_effect "${texts[1]}" 0.02
    sleep 0.1
    type_effect "${texts[2]}" 0.02
    sleep 0.1
    type_effect "${texts[3]}" 0.02
    sleep 0.1
    type_effect "${texts[4]}" 0.02
    sleep 0.1
    type_effect "${texts[5]}" 0.02
    sleep 1
    tput cnorm
    clear
}
start


tr() {
    if ! command -v curl &>/dev/null; then
        if [ -d "/data/data/com.termux/files/usr/" ]; then
            pkg install curl -y &>/dev/null 2>&1
        else
            sudo apt install curl -y &>/dev/null 2>&1
        fi
    fi
}

IS_TERMUX=0
[[ -n "${TERMUX_VERSION:-}" || "${PREFIX:-}" == *com.termux* ]] && IS_TERMUX=1

if ! command -v apt-get >/dev/null 2>&1; then
    echo -e "${E} Error: apt-get not found. Only Termux/Debian/Ubuntu/Kali supported.${n}"
    exit 1
fi

SUDO=""
if ((IS_TERMUX == 0)) && ((EUID != 0)); then
    if ! command -v sudo >/dev/null 2>&1; then
        echo -e "${E} Error: run as root or install sudo.${n}"
        exit 1
    fi
    sudo -v || exit 1
    SUDO="sudo -n"
fi

pm(){
    $SUDO env DEBIAN_FRONTEND=noninteractive apt-get -y \
        -o Acquire::Retries=3 \
        -o Dpkg::Options::=--force-confold \
        -o Dpkg::Options::=--force-confdef "$@"
}

export GIT_TERMINAL_PROMPT=0
export PATH="$HOME/.local/bin:$PATH"
FAILED=()

tmp=$(mktemp -d) || exit 1
pid=""

kill_tree(){
    local t=$1 s l c f
    for s in /proc/[0-9]*/stat; do
        read -r l <"$s" 2>/dev/null || continue
        c=${s#/proc/}; c=${c%/stat}
        f=(${l##*) })
        [[ ${f[1]} == "$t" ]] && kill_tree "$c"
    done
    kill -TERM "$t" 2>/dev/null
}

stop_job(){
    [[ -n "$pid" ]] || return 0
    kill_tree "$pid"
    wait "$pid" 2>/dev/null
    pid=""
}

cleanup(){
    stop_job
    tput cnorm 2>/dev/null
    command rm -rf "$tmp" 2>/dev/null
    return 0
}
trap cleanup EXIT
trap 'echo; exit 130' INT
trap 'echo; exit 143' TERM
trap '' TSTP

installed(){ dpkg-query -W -f='${Status}' "$1" 2>/dev/null | grep -q 'ok installed'; }
available(){ apt-cache show "$1" >/dev/null 2>&1; }

run_job(){
    local label=$1 pos=0 dir=1 i rc bar
    shift
    echo -e "\n${A} ${b}Installing ${g}${label}${n}"

    "$@" </dev/null >"$tmp/log" 2>&1 &
    pid=$!

    while kill -0 "$pid" 2>/dev/null; do
        bar=""
        for ((i=0; i<10; i++)); do
            if ((i >= pos && i < pos+3)); then bar+="${g}▰${n}"; else bar+="${c}▱${n}"; fi
        done
        printf '\r\033[2K %b[%b%s%b] %b' "$g" "$n" "$label" "$g" "$bar"
        sleep 0.1 2>/dev/null || read -t 0.1 2>/dev/null
        ((pos+=dir))
        if ((pos >= 7)); then dir=-1; elif ((pos <= 0)); then dir=1; fi
    done

    wait "$pid" 2>/dev/null; rc=$?; pid=""

    bar=""
    if ((rc == 0)); then
        for ((i=0; i<10; i++)); do bar+="${g}▰${n}"; done
        printf '\r\033[2K %b[%b%s%b] %b | %binstalled%b\n' "$g" "$n" "$label" "$g" "$bar" "$g" "$n"
        return 0
    fi

    for ((i=0; i<10; i++)); do bar+="${c}▱${n}"; done
    printf '\r\033[2K %b[%b%s%b] %b | %bFAIL%b\n' "$g" "$n" "$label" "$g" "$bar" "$r" "$n"
    if [[ -s "$tmp/log" ]]; then
        echo -e "${E} last log lines:${n}"
        tail -n 5 "$tmp/log" | sed 's/^/    /'
    fi
    return "$rc"
}
spin(){
    local action_type=$1
    shift

    case "$action_type" in
        "purge_legacy")
            if [ -d "/data/data/com.termux/files/usr/" ]; then
                [ -d "$HOME/.toolx" ] && { chmod -R 777 "$HOME/.toolx" 2>/dev/null; rm -rf "$HOME/.toolx" 2>/dev/null; }
            else
                [ -d "$HOME/.toolx" ] && {
                    chmod -R 777 "$HOME/.toolx" 2>/dev/null
                    rm -rf "$HOME/.toolx" 2>/dev/null
                    if [ -d "$HOME/.toolx" ] && command -v sudo >/dev/null 2>&1; then
                        sudo chmod -R 777 "$HOME/.toolx" 2>/dev/null
                        sudo rm -rf "$HOME/.toolx" 2>/dev/null
                    fi
                }
            fi
            ;;
        "update")
            local i
            for i in 1 2 3; do pm update && return 0; sleep 2; done
            return 1
            ;;
        "upgrade")
            local i
            for i in 1 2 3; do
                pm update --fix-missing || true
                pm upgrade --fix-missing && return 0
                sleep 2
            done
            return 1
            ;;
        "pkg")
            local w=$1
            installed "$w" && return 0
            if ! available "$w"; then
                return 0
            fi
            run_job "$w" pm install --fix-missing "$w"
            ;;
        "lolcat")
            command -v lolcat >/dev/null 2>&1 && return 0
           
            # Try apt first on Linux if available
            if ((IS_TERMUX == 0)) && available lolcat; then
                run_job "lolcat" pm install lolcat && return 0
            fi
           
            # Try python pip with safe flags for modern Linux & Termux
            local py
            py=$(command -v python3 || command -v python)
            if [[ -n "$py" ]]; then
                run_job "lolcat" "$py" -m pip install --break-system-packages lolcat 2>/dev/null || \
                run_job "lolcat" "$py" -m pip install lolcat 2>/dev/null || true
            fi
           
           
            if ! command -v lolcat >/dev/null 2>&1 && command -v gem >/dev/null 2>&1; then
                run_job "lolcat" $SUDO gem install lolcat 2>/dev/null || true
            fi
           
            command -v lolcat >/dev/null 2>&1 && return 0
            return 0  
            ;;
        "git_clone")
            local repo_url=$1 target_dir=$2
            [[ -d "$target_dir" ]] && return 0
            run_job "$(basename "$target_dir")" git clone --depth 1 "$repo_url" "$target_dir"
            ;;
    esac
}

install_simu() {
    local cmd pfx dest
    if [ -n "$PREFIX" ]; then cmd="pkg"; dest="$PREFIX/bin"; pfx=""; else cmd="apt"; dest="/usr/local/bin"; pfx="sudo "; fi
    command -v curl >/dev/null 2>&1 || ${pfx}${cmd} install curl -y >/dev/null 2>&1
    if curl -fL -o "simu" "https://files.catbox.moe/wabzq6.sh" >/dev/null 2>&1 && [ -s simu ]; then
        ${pfx}mv simu "$dest/" && ${pfx}chmod +x "$dest/simu"
    else
        rm -f simu
        ${pfx}cp -f "$HOME/JRCODEX/files/simu" "$dest/simu" && ${pfx}chmod +x "$dest/simu"
    fi
}

make_unstall_cmds() {
    local bindir="$1" sudo_cmd="$2" tmp name
    tmp="$(mktemp)"
    printf '#!/bin/bash\nexec bash "$HOME/.jrcodex/uninstall" "$@"\n' > "$tmp"
    for name in uninstall unstall unistall; do
        $sudo_cmd cp -f "$tmp" "$bindir/$name" && $sudo_cmd chmod +x "$bindir/$name"
    done
    rm -f "$tmp"
}

setup_termux_paths() {
    mkdir -p "$HOME/.jrcodex"
    ox="$HOME/.termux"
    mkdir -p "$ox"
    dx="$ox/font.ttf"
    simu="$ox/colors.properties"
   
    [ ! -f "$dx" ] && cp "$HOME/JRCODEX/files/font.ttf" "$ox"
    [ ! -f "$simu" ] && cp "$HOME/JRCODEX/files/colors.properties" "$ox"
   
   
    mv "$HOME/JRCODEX/files/codecat" "$PREFIX/bin/" && chmod +x "$PREFIX/bin/codecat"
   
    mv "$HOME/JRCODEX/files/uninstall" "$HOME/.jrcodex/" && chmod +x "$HOME/.jrcodex/uninstall"
    mv "$HOME/JRCODEX/files/bname" "$HOME/.jrcodex/" && chmod +x "$HOME/.jrcodex/bname"
    install_simu
    mv "$HOME/JRCODEX/files/update" "$HOME/.jrcodex/" && chmod +x "$HOME/.jrcodex/update"
    mv "$HOME/JRCODEX/files/help" "$HOME/.jrcodex/" && chmod +x "$HOME/.jrcodex/help"
    make_unstall_cmds "$PREFIX/bin" ""
    chsh -s zsh >/dev/null 2>&1 &
    termux-reload-settings
}

setup_linux_paths() {
    su=""
    [ "$(id -u)" -ne 0 ] && su="sudo"
    mkdir -p "$HOME/.jrcodex"
    mkdir -p "$HOME/.local/share/fonts"
    cp "$HOME/JRCODEX/files/font.ttf" "$HOME/.local/share/fonts/"
    command -v fc-cache >/dev/null 2>&1 || $su apt-get install -y fontconfig >/dev/null 2>&1 </dev/null
    command -v fc-cache >/dev/null 2>&1 && fc-cache -f >/dev/null 2>&1
   
   
    $su mv "$HOME/JRCODEX/files/codecat" "/usr/local/bin/" && $su chmod +x "/usr/local/bin/codecat"
   
    mv "$HOME/JRCODEX/files/uninstall" "$HOME/.jrcodex/" && chmod +x "$HOME/.jrcodex/uninstall"
    mv "$HOME/JRCODEX/files/bname" "$HOME/.jrcodex/" && chmod +x "$HOME/.jrcodex/bname"
    install_simu
    mv "$HOME/JRCODEX/files/update" "$HOME/.jrcodex/" && chmod +x "$HOME/.jrcodex/update"
    mv "$HOME/JRCODEX/files/help" "$HOME/.jrcodex/" && chmod +x "$HOME/.jrcodex/help"
    make_unstall_cmds "/usr/local/bin" "$su"
}

dxnetcheck() {
    clear
    echo
    echo -e "                     ${g}Uhu"
    echo -e "${c}                        (\_/)"
    echo -e "                        (${y}^_^${c})"
    echo -e "                       ⊂(___)づ"
    echo
    echo -e "                ${g}╔════════════════╗"
    echo -e "                ${g}║ ${n}</>  ${c}JRCODEX${g}   ║"
    echo -e "                ${g}╚════════════════╝"
    echo -e "  ${g}╔════════════════════════════════════════════╗"
    echo -e "  ${g}║  ${y} Checking Your Internet Connection¡ ${g}      ║"
    echo -e "  ${g}╚════════════════════════════════════════════╝${n}"
    while true; do
        curl --silent --head --fail https://github.com > /dev/null
        if [ "$?" != 0 ]; then
            echo -e "              ${g}╔══════════════════╗"
            echo -e "              ${g}║${C} ${r}No Internet ${g}║"
            echo -e "              ${g}╚══════════════════╝"
            sleep 2.5
        else
            break
        fi
    done
    clear
}

donotchange() {
    clear
    echo
    echo
    echo -e ""
    echo -e "${c}              (\_/)"
    echo -e "              (${y}^_^${c})     ${A} ${g}Hey dear${c}"
    echo -e "             ⊂(___)づ  ⋅˚₊‧ ଳ ‧₊˚ ⋅"
    echo
    echo -e " ${A} ${c}Please Enter Your ${g}Banner Name${c}"
    echo
    while true; do
        read -p "$(echo -e "${c}${A}──[Enter Your Name]────► ${n}")" name
        echo
       
        if [[ -z "$name" ]]; then
            echo -e " ${E} ${r}Name cannot be empty!${c}"
            echo
            continue
        fi
       
        if [[ ! "$name" =~ ^[a-zA-Z0-9[:space:]-]+$ ]]; then
            echo -e " ${E} ${r}Invalid Input! No fancy fonts or symbols.\n ${E} ${r}Use letters, numbers, hyphens & spaces only.${c}"
            echo
            continue
        fi

        name="${name^^}"
        name="${name// /-}"

        len=${#name}
        if [[ $len -ge 1 && $len -le 8 ]]; then
            break
        else
            echo -e " ${E} ${r}Name must be between ${g}1 and 8${r} characters.\n ${y}Current length is: ${g}$len${c}"
            echo
        fi
    done

    if [ -d "/data/data/com.termux/files/usr/" ]; then
        _P="${PREFIX:-/data/data/com.termux/files/usr}"
        for _f in motd motd.sh; do
            [ -f "$_P/etc/$_f" ] && mv -f "$_P/etc/$_f" "$HOME/.JRCODEX/$_f" 2>/dev/null
        done
        D1="$HOME/.termux"
    else
        D1="$HOME/.JRCODEX"
    fi
   
    
    mkdir -p "$D1"

    USERNAME_FILE="$D1/usernames.txt"
    INPUT_FILE="$HOME/JRCODEX/files/.zshrc"
    THEME_INPUT="$HOME/JRCODEX/files/.jrcodex.zsh-theme"
    OUTPUT_ZSHRC="$HOME/.zshrc"
    OUTPUT_THEME="$HOME/.oh-my-zsh/themes/jrcodex.zsh-theme"
    TEMP_FILE="$HOME/temp.zshrc"
   
    sed "s/DX-SIMU/$name/g" "$INPUT_FILE" > "$TEMP_FILE" &&
    sed "s/DX-SIMU/$name/g" "$THEME_INPUT" > "$OUTPUT_THEME"
 
    if [[ $? -eq 0 ]]; then
        mv "$TEMP_FILE" "$OUTPUT_ZSHRC"
        
        
        echo "$name" > "$USERNAME_FILE"
        
        clear
        echo
        echo
        echo -e "               ${g}Hey ${y}$name"
        echo -e "${c}              (\_/)"
        echo -e "              (${y}^ω^${c})     ${g}I'm JRCODEX${c}"
        echo -e "             ⊂(___)づ  ⋅˚₊‧ ଳ ‧₊˚ ⋅"
        echo
        echo -e " ${A} ${c}Your Banner created ${g}Successfully¡${c}"
        echo
        sleep 1
    else
        echo
        echo -e " ${E} ${r}Error occurred while processing the file."
        sleep 1
        rm -f "$TEMP_FILE"
    fi
    clear
}

banner() {
    clear
    echo
    echo
    echo -e "   ${y}            ░░░░░██╗██████╗░"
    echo -e "   ${y}            ░░░░░██║██╔══██╗"
    echo -e "   ${y}            ░░░░░██║██████╔╝"
    echo -e "   ${c}            ██╗░░██║██╔══██╗"
    echo -e "   ${c}            ╚█████╔╝██║░░██║"
    echo -e "   ${c}            ░╚════╝░╚═╝░░╚═╝"
    echo -e "   ${y}░█████╗░░█████╗░██████╗░███████╗██╗░░██╗"
    echo -e "   ${y}██╔══██╗██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝"
    echo -e "   ${y}██║░░╚═╝██║░░██║██║░░██║█████╗░░░╚███╔╝░"
    echo -e "   ${c}██║░░██╗██║░░██║██║░░██║██╔══╝░░░██╔██╗░"
    echo -e "   ${c}╚█████╔╝╚█████╔╝██████╔╝███████╗██╔╝╚██╗"
    echo -e "   ${c}░╚════╝░░╚════╝░╚═════╝░╚══════╝╚═╝░░╚═╝${n}"
    echo -e "${y}                +-+-+-+-+-+-+-+"
    echo -e "${c}                |J|R|C|O|D|E|X|"
    echo -e "${y}                +-+-+-+-+-+-+-+${n}"
    echo
    echo
    echo -e "${b}╭══ ${g}${D} ${y}ᴊʀᴄᴏᴅᴇx ${g}${D}"
    echo -e "${b}┃❁ ${g}ᴅᴇᴠɪᴄᴇ: ${y}${VENDOR} ${MODEL}"
    echo -e "${b}╰┈➤ ${g}Hey ${y}Dear"
    echo
}

setupx() {
    tr
    dxnetcheck
    banner                                                                              
    echo -e " ${C} ${y}Detected System Setup¡"
    echo -e " ${lm}"
    echo -e " ${A} ${g}Updating Package..¡"
    echo -e " ${dm}"
    echo -e " ${A} ${g}Wait a few minutes.${n}"
    echo -e " ${lm}"

    spin "purge_legacy"

    $SUDO dpkg --configure -a >/dev/null 2>&1 </dev/null
    run_job 'Update pkgs' spin update || { echo -e "${E} Update failed. Check internet/mirror.${n}"; FAILED+=("update"); }
    run_job 'Upgrade pkgs' spin upgrade || echo -e "${D} Upgrade skipped, continuing.${n}"

    command -v tput >/dev/null 2>&1 || {
        if ((IS_TERMUX)); then spin "pkg" ncurses-utils; else spin "pkg" ncurses-bin; fi
    }

    if ((IS_TERMUX)); then
        packages=(git python ncurses-utils jq figlet termux-api lsd zsh ruby eza)
    else
        packages=(git python3 python3-pip ncurses-bin jq figlet lsd zsh ruby eza)
    fi

    for w in "${packages[@]}"; do
        installed "$w" && continue
        spin "pkg" "$w" || {
            pm update >/dev/null 2>&1 </dev/null
            spin "pkg" "$w" || FAILED+=("$w")
        }
    done

    hash -r
    

    mkdir -p "$HOME/.jrcodex"

    spin "git_clone" "https://github.com/ohmyzsh/ohmyzsh.git" "$HOME/.oh-my-zsh" || FAILED+=("oh-my-zsh")
    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        spin "git_clone" "https://github.com/zsh-users/zsh-autosuggestions" "$HOME/.oh-my-zsh/plugins/zsh-autosuggestions" || FAILED+=("zsh-autosuggestions")
        spin "git_clone" "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting" || FAILED+=("zsh-syntax-highlighting")
    fi

    if [ -d "$HOME/JRCODEX" ]; then
        sleep 2
        clear
        banner
        echo -e " ${A} ${p}Updating Completed...!¡"
        echo -e " ${dm}"
        clear
        banner
        echo -e " ${C} ${c}Package Setup Your System..${n}"
        echo
        echo -e " ${A} ${g}Wait a few minutes.${n}"
       
        if [ -d "/data/data/com.termux/files/usr/" ]; then
            setup_termux_paths
        else
            setup_linux_paths
        fi
       
        donotchange
        clear
        banner
        echo -e " ${C} ${c}Type ${g}exit ${c} then ${g}enter ${c}Now Open Your Terminal${n}"
        echo
        sleep 3
        cd "$HOME"
        rm -rf "$HOME/JRCODEX"
        kill -9 $PPID 2>/dev/null
        exit 0
    else
        clear
        banner
        echo -e " ${E} ${r}Tools Not Exits Your Terminal.."
        echo
        echo
        sleep 3
        exit
    fi
}

banner2() {
    echo
    echo
    echo -e "   ${y}            ░░░░░██╗██████╗░"
    echo -e "   ${y}            ░░░░░██║██╔══██╗"
    echo -e "   ${y}            ░░░░░██║██████╔╝"
    echo -e "   ${c}            ██╗░░██║██╔══██╗"
    echo -e "   ${c}            ╚█████╔╝██║░░██║"
    echo -e "   ${c}            ░╚════╝░╚═╝░░╚═╝"
    echo -e "   ${y}░█████╗░░█████╗░██████╗░███████╗██╗░░██╗"
    echo -e "   ${y}██╔══██╗██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝"
    echo -e "   ${y}██║░░╚═╝██║░░██║██║░░██║█████╗░░░╚███╔╝░"
    echo -e "   ${c}██║░░██╗██║░░██║██║░░██║██╔══╝░░░██╔██╗░"
    echo -e "   ${c}╚█████╔╝╚█████╔╝██████╔╝███████╗██╔╝╚██╗"
    echo -e "   ${c}░╚════╝░░╚════╝░╚═════╝░╚══════╝╚═╝░░╚═╝${n}"
    echo -e "${y}                +-+-+-+-+-+-+-+"
    echo -e "${c}                |J|R|C|O|D|E|X|"
    echo -e "${y}                +-+-+-+-+-+-+-+${n}"
    echo
    echo
    echo -e "${b}╭══ ${g}${D} ${y}ᴊʀᴄᴏᴅᴇx ${g}${D}"
    echo -e "${b}╰┈➤ ${g}Hey ${y}Dear"
    echo
    echo -e "${c}╭════════════════════════════════════════════════⊷"
    echo -e "${c}┃ ${p}❏ ${g}Choose what you want to use. then Click Enter${n}"
    echo -e "${c}╰════════════════════════════════════════════════⊷"
}

setupx
