# mp3plyr-converter
This is a tool that I developed with the assistance of AI to help make transferring videos to MP3 players easier. *Not all MP3 players; read the description for more info

I recently purchased an MP3 player from Kmart (link at the bottom) for my simple daily needs. I saw that it had video functionality, and thought that I would use this feature to disconnect from my phone and watch a short video offline. When I later got the product, I realized that you couldn't just drag and drop .mp4 or .webm files onto it. It required a .avi format. So I converted it and when I tried to open it, it said "Video formats not supported".

It turns out that the MP3 player requires a specific format of an .avi file, having the resolution of 160x128, and also having to make the frame rate lowered to 16 fps, along with much more stuff. I found this out to this very helpful Reddit post : https://www.reddit.com/r/techsupport/comments/18btdo1/mp3_player_video_formats_not_supported_issue/

Rudraksh32 has provided a link to another GitHub repo containing a few files. You can drag and drop each of these files to see which one works for you.
https://github.com/fdd4s/portable_mp3_player_video_converter_tools

For me, the one that worked was the "shenju18.avi" file. fdd42 has already created a .sh script to convert any video file to this special format, but I decided to make this to make the conversion for people on Windows easier. 

NOTE : You will have to install ffmpeg for the conversion to work. I installed this via winget, so the process for me was relatively easy. Feel free to use ffmpeg too.
