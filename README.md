##

A ruby script to download the audio stream of any kind of youtube video without constraint.
It will bypass copyright restrictions, VEVO accounts...

## Needed Gems
- bundler
- gems bundled in Gemfile

## Install
clone the repo and run `bundle install`

## Commands
Download a song by name into folder '~/Music/'<br/>
`bundle exec download_m4a.rb "Titanic Song"`<br/>
Download from a youtube link into folder '~/songs/'<br/>
`bundle exec download_m4a.rb https://www.youtube.com/watch?v=bM7SZ5SBzyY ~/songs/`<br/>
<br/>
Download all songs in a youtube playlist<br/>
`bundle exec download_m4a.rb https://www.youtube.com/playlist?list=PL9B23A78D3D249A74`<br/>
Download multiple songs from a file containing several youtube urls, song names or playlist urls (one per line). Basically all the above options in a `.txt` file<br/>
`bundle exec download_m4a.rb songs.txt`<br/>
<br/>
By default all the .m4a files will be stored into the folder named "~/Music/" (will be created if it doesn't exist). You can change the folder name by passing a second argument to the command line as shown in the second example above. DO NOT FORGET the endind '/' on the folder name, or else it will be treated as a filename prefix instead of a folder path.

## Original Author
Based on https://github.com/ggouzi/Youtube-Download-Songs, only changed it to download songs by name, in m4a format and supporting playlists.

## Licence
This project is licensed under the GNU GPL v2. See GPL.txt for details.
