import express from 'express';
import { delComment, delImage, getComment, getImageByName, getImages, infoOfImage, postComment, putComment, saves } from '../controllers/postController.js';

const postRoute = express.Router();

postRoute.get('/images', getImages)
postRoute.get('/search', getImageByName)
postRoute.get('/image/:imageId', infoOfImage)
postRoute.delete('/image/:imageId', delImage)
postRoute.get('/comments/:imageId', getComment)
postRoute.post('/image/:imageId/save', saves)
postRoute.post('/comments', postComment)
postRoute.put('/comments', putComment)
postRoute.delete('/comments/:commentId', delComment)

export default postRoute;