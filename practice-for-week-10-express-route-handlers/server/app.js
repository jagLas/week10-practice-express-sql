// Phase 2
const {
  getAllArtists,
  getLatestArtist,
  getArtistByArtistId,
  addArtist,
  editArtistByArtistId,
  deleteArtistByArtistId,
  getAlbumsForLatestArtist,
  getAlbumsByArtistId,
  getAlbumByAlbumId,
  addAlbumByArtistId,
  editAlbumByAlbumId,
  deleteAlbumByAlbumId,
  getFilteredAlbums,
  getSongsByArtistId,
  getSongsByAlbumId,
  getSongBySongId,
  addSongByAlbumId,
  editSongBySongId,
  deleteSongBySongId
} = require('./data');

const express = require('express');
const app = express();

// Your code here
app.use(express.json());
app.use((req, res, next) => {
  console.log('Request Body:', req.body);
  next();
});

app.get('/artists/latest/albums', (req, res) => {
  const albums = getAlbumsForLatestArtist();
  res.json(albums);
})

app.get('/artists/latest', (req, res) => {
  const artist = getLatestArtist();
  res.json(artist)
})

app.get('/artists', (req, res) => {
  const artists = getAllArtists();
  console.log(artists)
  res.json(artists)
})

app.post('/artists', (req, res) => {
  const artist = addArtist(req.body);
  res.status(201);
  res.json(artist)
})


// DO NOT MODIFY
if (require.main === module) {
  const port = 8000;
  app.listen(port, () => console.log('Server is listening on port', port));
} else {
  module.exports = app;
}