import sequelize from '../models/connect.js';
import initModels from '../models/init-models.js';
import responseApi from '../config/reponse.js';
import { Op } from 'sequelize';
import { dataToken } from '../config/jwt.js';

const model = initModels(sequelize);

const getImages = async (req, res) => {
    try {
        let data = await model.images.findAll({
            include: ["user"]
        });
        responseApi(res, 200, data, 'Lấy tất cả ảnh thành công !');
    } catch (error) {
        console.log(error);
        responseApi(res, 400, '', 'Xử lý không thành công!')
    }
};

const getImageByName = async (req, res) => {
    try {
        let { name } = req.body;
        let data = await model.images.findAll({
            where: {
                image_name: { [Op.like]: `%${name}%` }
            }
        });
        if (data.length > 0) {
            responseApi(res, 200, data, 'Thành công!');
            return;
        }
        responseApi(res, 200, '', 'Ảnh không tồn tại!');
    } catch (error) {
        console.log(error);
        responseApi(res, 400, '', 'Xử lý không thành công!');
    }
};

const infoOfImage = async (req, res) => {
    try {
        let { imageId } = req.params;
        let data = await model.images.findOne({
            where: { image_id: imageId },
            include: ['user']
        });
        if (data) {
            responseApi(res, 200, data, 'Thành công !');
            return
        }
        responseApi(res, 200, data, 'Ảnh không tồn tại!');
    } catch (error) {
        responseApi(res, 400, data, 'Xử lý không thành công!');
    }
};

const delImage = async (req, res) => {
    try {
        let { authorization } = req.headers;
        const token = authorization.replace("Bearer ", "");
        let { userId } = dataToken(token);
        let { imageId } = req.params;
        let image = await model.images.findOne({
            where: {
                image_id: imageId,
                user_id: userId
            }
        });
        if (image) {
            await model.images.update(
                { ...image, isDelete: 1 }, {
                where: {
                    image_id: image.dataValues.image_id
                }
            });
            responseApi(res, 200, '', 'Xoá ảnh thành công!')
            return
        };
        responseApi(res, 200, '', 'Người dùng không tạo ảnh này!')
    } catch (error) {
        console.log(error);
        responseApi(res, 400, '', 'Xử lý không thành công!')
    }
};


const getComment = async (req, res) => {
    try {
        let { imageId } = req.params;
        let comment = await model.comments.findAll({
            where: { image_id: imageId }
        });
        responseApi(res, 200, comment, 'Thành công!')
    } catch (error) {
        responseApi(res, 400, '', 'Xử lý không thành công !')
    }
};

const saves = async (req, res) => {
    try {
        let { authorization } = req.headers;
        const token = authorization.replace("Bearer ", "");
        let { userId } = dataToken(token);
        let { imageId } = req.params;
        let image = await model.images.findOne({
            where: { image_id: imageId }
        });
        if (!image) return responseApi(res, 400, '', 'Ảnh không tồn tại !')
        let data = await model.saves.findOne({
            where: {
                image_id: imageId,
                user_id: userId
            }
        });
        if (data) {
            if (data.dataValues.isSave) {
                await model.saves.update(
                    { ...data, isSave: 0 }, {
                    where: {
                        save_id: data.dataValues.save_id
                    }
                })
                responseApi(res, 200, '', 'Huỷ lưu thành công!')
                return;
            }else {
                await model.saves.update(
                    { ...data, isSave: 1 }, {
                    where: {
                        save_id: data.dataValues.save_id
                    }
                })
                responseApi(res, 200, '', 'Lưu thành công!')
                return;
            }
        }
        await model.saves.create({
            image_id: imageId,
            user_id: userId,
            isSave: 1,
            create_at: new Date()
        })
        responseApi(res, 200, '', 'Lưu ảnh thành công')
    } catch (error) {
        console.log(error)
        responseApi(res, 400, '', 'Xử lý không thành công!')
    }
};

const postComment = async (req, res) => {
    try {
        let { imageId } = req.params;
        let { content } = req.body;
        let { authorization } = req.headers;
        const token = authorization.replace("Bearer ", "");
        let { userId } = dataToken(token);
        let newComment = {
            content: content,
            user_id: userId,
            image_id: imageId,
            create_at: new Date()
        };
        await model.comments.create(newComment)
        responseApi(res, 200, '', 'Xử lý thành công!')
    } catch (error) {
        responseApi(res, 400, '', 'Xử lý không thành công!')
    }
};

const putComment = async (req, res) => {
    try {
        let { imageId } = req.params;
        let { content } = req.body;
        let { authorization } = req.headers;
        const token = authorization.replace("Bearer ", "");
        let { userId } = dataToken(token);
        let comment = await model.comments.findOne({
            where: {
                user_id: userId,
                image_id: imageId
            }
        });
        await model.comments.update({
            ...comment, content, creat_at: new Date()
        }, {
            where: { comment_id: comment.dataValues.comment_id }
        });
        responseApi(res, 200, comment, 'Thành công!')
    } catch (error) {
        responseApi(res, 400, '', 'Xử lý không thành công!')
    }
};

const delComment = async (req, res) => {
    try {
        let { imageId } = req.params;
        let { content } = req.body;
        let { authorization } = req.headers;
        const token = authorization.replace("Bearer ", "");
        let { userId } = dataToken(token);
        let comment = await model.comments.findOne({
            where: {
                image_id: imageId,
                user_id: userId,
                content
            }
        });
        if (comment) {
            await model.comments.update(
                { ...comment, isDelete: 1 }, {
                where: {
                    comment_id: comment.dataValues.comment_id
                }
            })
            responseApi(res, 200, '', 'Xoá thành công!')
            return
        }
        responseApi(res, 200, '', 'Không tìm thấy comment!')
    } catch (error) {
        console.log(error);
        responseApi(res, 400, '', 'Xử lý không thành công!')
    }
};


export {
    getImages,
    getImageByName,
    infoOfImage,
    getComment,
    postComment,
    putComment,
    delComment,
    saves,
    delImage
}