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

app.get('/artists/:artistId/albums', (req, res) => {
  const result = getAlbumsByArtistId(req.params.artistId);
  res.json(result)
})

app.post('/artists/:artistId/albums', (req, res) => {
  res.status(201).json(addAlbumByArtistId(req.params.artistId, req.body));
})

app.get('/artists/:artistId', (req, res) => {
  const artist = getArtistByArtistId(req.params.artistId);
  if (artist) {
    res.json(artist);
  }
})

app.delete('/artists/:artistId', (req, res) => {
  console.log(req.params.artistId)
  const result = deleteArtistByArtistId(req.params.artistId);
  console.log(result)
  if (result === undefined) {
    res.json({"message":'Successfully deleted'});
  }
})

app.put('/artists/:artistId', editArtistRouteHandler);
app.patch('/artists/:artistId', editArtistRouteHandler);

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

app.get('/albums/:albumId', (req, res) => {
  res.json(getAlbumByAlbumId(req.params.albumId))
})

app.put('/albums/:albumId', editAlbumByAlbumIdHandler);
app.patch('/albums/:albumId', editAlbumByAlbumIdHandler);

app.delete('/albums/:albumId', (req, res) => {
  const albumId = req.params.albumId;
  const album = getAlbumByAlbumId(albumId);
  if (album) {
    deleteAlbumByAlbumId(albumId);
    res.json({message: 'Successfully deleted'})
  }
})

app.get('/albums', (req, res) => {
  const filtered = getFilteredAlbums(req.query.startsWith);
  res.json(filtered);
})

function editArtistRouteHandler (req, res) {
  const artistId = req.params.artistId;
  const artist = getArtistByArtistId(artistId);
  if (artist) {
    res.json(editArtistByArtistId(artistId, req.body));
  }
}

function editAlbumByAlbumIdHandler(req, res) {
  res.json(editAlbumByAlbumId(req.params.albumId, req.body))
}

// DO NOT MODIFY
if (require.main === module) {
  const port = 8000;
  app.listen(port, () => console.log('Server is listening on port', port));
} else {
  module.exports = app;
}