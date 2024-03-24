import express from 'express';
import userRoute from './user.js';
import postRoute from './posts.js';
import uploadRoute from './upload.js';

const rootRoute = express.Router();

rootRoute.use('/user', userRoute);
rootRoute.use('/post', postRoute);
rootRoute.use('/upload', uploadRoute)

export default rootRoute;