# ===============
#    Playlists
# ===============

get '/playlists' do 
  @playlists = Playlist.all
  erb :'playlists/index'
end
 
get '/playlists/new' do 
  erb :'playlists/new'
end
 
get '/playlists/:id' do 
  @playlist = Playlist.find(params[:id])
  @songs = Song.all
  erb :'playlists/show'
end
 
put '/playlists/:id/add_song' do
  playlist = Playlist.find(params[:id])
  song = Song.find(params[:song_id])
  playlist.songs.push(song)
  redirect "/playlists/#{playlist.id}"
end
 
put '/playlists/:id/remove_song' do
  playlist = Playlist.find(params[:id])
  song = Song.find(params[:song_id])
  playlist.songs.destroy(song)
  redirect "/playlists/#{playlist.id}"
end