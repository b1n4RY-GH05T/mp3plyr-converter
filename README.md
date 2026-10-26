# mp3plyr-converter
This is a tool that I developed with the assistance of AI to help make transferring videos to MP3 players easier. *Not all MP3 players; read the description for more info

I recently purchased an MP3 player from Kmart (link at the bottom) for my simple daily needs. I saw that it had video functionality, and thought that I would use this feature to disconnect from my phone and watch a short video offline. When I later got the product, I realized that you couldn't just drag and drop .mp4 or .webm files onto it. It required a .avi format. So I converted it and when I tried to open it, it said "Video formats not supported".

It turns out that the MP3 player requires a specific format of an .avi file, having the resolution of 160x128, and also having to make the frame rate lowered to 16 fps, along with much more stuff. I found this out to this very helpful Reddit post : _https://www.reddit.com/r/techsupport/comments/18btdo1/mp3_player_video_formats_not_supported_issue/_

_Rudraksh32_ has provided a link to another GitHub repo containing a few files. You can drag and drop each of these files to see which one works for you.
_https://github.com/fdd4s/portable_mp3_player_video_converter_tools_

For me, the one that worked was the "shenju18.avi" file. _fdd4s_ has already created a .sh script to convert any video file to this special format, but I decided to make this to make the conversion for people on Windows easier. 

__NOTE__ : You will have to install ffmpeg for the conversion to work. The current full build (9.0.2) is 245MB. I installed this via winget, so the process for me was relatively easy. I have also provided a "installer.bat" file to make the installation and copying of the path easier.

After installing ffmpeg using the file, it will give you the full path of the ffmpeg.exe file. Don't worry if you already have ffmpeg installed; the "installer.bat" file won't reinstall ffmpeg but it will still provide the full path of the current ffmpeg installation to you. 

Now we can workk on actually converting the files. Download the "avi_converter.bat" file. This is the file which will convert the video file the the correct format.
Before we use it though we need to make a few changes inside the file. Open it with a text editor of your choice and change the line where it says :

_set "FFMPEG_PATH=path_here"_

and change the path to the full path that the "installer.bat" gave you. For me, the full line looked like this :

_set "FFMPEG_PATH=C:\Users\my_username\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-9.0.2-full_build\bin\ffmpeg.exe"_

(The path will vary from computer to computer. This is why I made the installer script)

Now save the file with the updated path. And when you want to convert any video file (.webm, .mp4) to a format that the MP3 player can read, simply right click the file, hover over "Open with", click "Choose another app". When the menu pops up, scroll all the way to the bottom, and click on "Choose an app on your PC". When the Explorer window pops up, choose the "avi_converter.bat" file and after confirming it will start to encode that video in the format that is compatible with the mp3 player. 
