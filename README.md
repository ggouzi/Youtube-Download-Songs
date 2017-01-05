[![Code Climate](https://codeclimate.com/github/heavenstudio/ytsongdw/badges/gpa.svg)](https://codeclimate.com/github/heavenstudio/ytsongdw)

[![Test Coverage](https://codeclimate.com/github/heavenstudio/ytsongdw/badges/coverage.svg)](https://codeclimate.com/github/heavenstudio/ytsongdw/coverage)

##

A rubygem to download the audio stream of any kind of youtube video without constraint.
It will bypass copyright restrictions, VEVO accounts...

## Install
gem install ytsongdw

## Commands
Download a song by name into folder '~/Music/'<br/>
`ytsongdw 'Titanic Song'`<br/>
Download from a youtube link into folder '~/songs/'<br/>
`ytsongdw https://www.youtube.com/watch?v=bM7SZ5SBzyY ~/songs/`<br/>
<br/>
Download all songs in a youtube playlist<br/>
`ytsongdw https://www.youtube.com/playlist?list=PL9B23A78D3D249A74`<br/>
Download multiple songs from a file containing several youtube urls, song names or playlist urls (one per line). Basically all the above options in a `.txt` file<br/>
`ytsongdw songs.txt`<br/>
<br/>
By default all the .m4a files will be stored into the folder named "~/Music/" (will be created if it doesn't exist). You can change the folder name by passing a second argument to the command line as shown in the second example above. DO NOT FORGET the endind '/' on the folder name, or else it will be treated as a filename prefix instead of a folder path.

## Original Author
Based on https://github.com/ggouzi/Youtube-Download-Songs, only changed it to download songs by name, in m4a format and supporting playlists.

## Licence
This project is licensed under the GNU GPL v2. See GPL.txt for details.
