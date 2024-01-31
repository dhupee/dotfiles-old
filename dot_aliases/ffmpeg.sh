# Aliases and functions for FFMPEG

alias ffconv="ffmpeg -i"

# Function to convert to 720p (16:9)
ff720p16:9() {
    ffmpeg -i "$1" -vf "scale=1280:720,setsar=1:1" -c:a copy -aspect 16:9 "$2"
}

# Function to convert to 480p (16:9)
ff480p16:9() {
    ffmpeg -i "$1" -vf "scale=854:480,setsar=1:1" -c:a copy -aspect 16:9 "$2"
}

# Function to convert to 360p (16:9)
ff360p16:9() {
    ffmpeg -i "$1" -vf "scale=640:360,setsar=1:1" -c:a copy -aspect 16:9 "$2"
}
