import express from 'express';
import multer from 'multer';
import responseApi from '../config/reponse.js';
import { dataToken } from '../config/jwt.js';
import images from '../models/images.js';

const uploadRoute = express.Router();

const storage = multer.diskStorage({
    destination: process.cwd() + '/public/img',
    filename: (req, file, callback) => {
        callback(null, new Date().getTime() + "_" + file.originalname)
    }
});
const upload = multer({ storage })

uploadRoute.post('', upload.single('image'), async (req, res) => {
    try {
        let { file } = req; 
        let { description } = req.body;
        let { authorization } = req.headers;
        const token = authorization.replace("Bearer ", "");
        let { userId } = dataToken(token);
        let newImage = {
            image_name: file.originalname,
            url: file.filename,
            description,
            user_id: userId,
            create_at: new Date()
        }
        await images.create(newImage)
        responseApi(res, 200, '', 'Thêm ảnh thành công!')
    } catch (error) {
        console.log(error)
        responseApi(res, 400, '', 'Xử lý không thành công!')
    }
})


export default uploadRoute;