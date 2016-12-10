##

A ruby script to download the audio stream of any kind of youtube video without constraint.
It will bypass copyright restrictions, VEVO accounts...

## Needed Gems
- bundler
- gems bundled in Gemfile

## Install
clone the repo and run `bundle install`

## Commands
Download a song by name<br/>
`bundle exec download_m4a.rb "Titanic Song"`<br/>
Download from a youtube link<br/>
`bundle exec download_m4a.rb https://www.youtube.com/watch?v=bM7SZ5SBzyY`<br/>
<br/>
Download multiple songs from a file containing several youtube urls or song names (one per line)<br/>
`bundle exec download_m4a.rb songs.txt`<br/>
<br/>
All the .m4a files will be stored into the folder named "~/Music" (will be created if it doesn't exist). You can change the folder name by changing the DOWNLOAD_DIRECTORY constant value on download_m4a.rb:9

## Original Author
Based on https://github.com/ggouzi/Youtube-Download-Songs, only changed it to download songs by name and in m4a format

## Licence
This project is licensed under the GNU GPL v2. See GPL.txt for details.
