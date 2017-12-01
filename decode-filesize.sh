avconv -y -i $1 -c:a copy -c:v libx264 -preset medium -b:v $2 -pass 1 -an -f mp4 /dev/null && \
avconv -i $1 -c:a copy -c:v libx264 -preset medium -b:v $2 -pass 2 output.mp4
