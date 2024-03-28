import express from 'express';
import { changeInfo, changePassword, infoUser, listImageCreateByUser, listImageSaveByUser, login, register, resetToken } from '../controllers/userController.js';
import { midVerifyToken } from '../config/jwt.js';

const userRoute = express.Router();

userRoute.post('/register', register)
userRoute.post('/login', login)
userRoute.post('/reset-token', resetToken)
userRoute.get('' ,midVerifyToken, infoUser)
userRoute.put('/changePassword', midVerifyToken ,changePassword)
userRoute.put('/changeInfo', midVerifyToken, changeInfo)
userRoute.get('/list-save', midVerifyToken, listImageSaveByUser)
userRoute.get('/list-create', midVerifyToken, listImageCreateByUser)

export default userRoute;