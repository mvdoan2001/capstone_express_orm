import express from 'express';
import { changeInfo, changePassword, delUser, infoUser, listImageCreateByUser, listImageSaveByUser, login, register, resetToken } from '../controllers/userController.js';

const userRoute = express.Router();

userRoute.post('/register', register)
userRoute.post('/login', login)
userRoute.post('/reset-token', resetToken)

userRoute.get('', infoUser)
userRoute.put('/changePassword', changePassword)
userRoute.put('/changeInfo', changeInfo)
userRoute.delete('/deleteUser', delUser)
userRoute.get('/list-save', listImageSaveByUser)
userRoute.get('/list-create', listImageCreateByUser)


export default userRoute;