import sequelize from '../models/connect.js';
import initModels from '../models/init-models.js';
import responseApi from '../config/reponse.js';
import bcrypt from 'bcrypt';
import { checkTokenRef, createToken, createTokenRef, dataToken } from '../config/jwt.js';

const model = initModels(sequelize);


const register = async (req, res) => {
    try {
        let { fullName, age, email, password } = req.body

        let newUser = {
            user_name: fullName,
            age: age,
            email: email,
            password: bcrypt.hashSync(password, 10),
            create_at: new Date()
        }
        let checkEmail = await model.users.findOne({
            where: { email }
        })
        if (checkEmail) {
            responseApi(res, 400, '', 'Email đã tồn tại!')
            return
        }
        await model.users.create(newUser)
        responseApi(res, 200, '', 'Đăng ký thành công!')
    } catch (error) {
        responseApi(res, 500, "", "Đăng ký không thành công!")
    }
};

const login = async (req, res) => {
    try {
        let { email, password } = req.body
        let checkEmail = await model.users.findOne({
            where: { email }
        });

        if (checkEmail) {
            if (bcrypt.compareSync(password, checkEmail.dataValues.password)) {
                let key = new Date().getTime()
                let token = createToken({ userId: checkEmail.dataValues.user_id, key });
                let tokenRef = createTokenRef({ userId: checkEmail.dataValues.user_id, key });
                await model.users.update({
                    ...checkEmail, refresh_token: tokenRef
                }, {
                    where: {
                        user_id: checkEmail.dataValues.user_id
                    }
                })
                responseApi(res, 200, token, 'Đăng nhập thành công')
            } else {
                responseApi(res, 400, '', 'Mật khẩu không đúng!')
            }
        } else {
            responseApi(res, 400, '', 'Email không đúng!')
        }
    } catch (error) {
        responseApi(res, 500, "", "Đăng nhập không thành công!")
    }

};

const resetToken = async (req, res) => {
    try {
        let { authorization } = req.headers;
        const token = authorization.replace("Bearer ", "");
        let { userId, key } = dataToken(token);
        let checkUser = await model.users.findOne({
            where: {
                user_id: userId
            }
        });
        if (checkUser) {
            let checkRef = checkTokenRef(checkUser.dataValues.refresh_token);
            let decodeRef = dataToken(checkUser.dataValues.refresh_token);
            if (checkRef == null && key == decodeRef.key) {
                let token = createToken({ userId: checkUser.dataValues.user_id, key: decodeRef.key });
                responseApi(res, 200, token, 'Thành công!')
                return
            };
        }
        responseApi(res, 401, '', 'Unauthoried')
    } catch (error) {
        console.log(error);
        responseApi(res, 400, '', 'Xử lý không thành công!')
    }
};

const infoUser = async (req, res) => {
    try {
        let { authorization } = req.headers;
        const token = authorization.replace("Bearer ", "");
        let { userId } = dataToken(token);
        let data = await model.users.findOne({
            where: {
                user_id: userId
            }
        });
        responseApi(res, 200, data, 'Thành công')
    } catch (error) {
        responseApi(res, 400, "", "Xử lý không thành công!")
    }
};

const changePassword = async (req, res) => {
    try {
        let { newPassword } = req.body;
        let { authorization } = req.headers;
        const token = authorization.replace("Bearer ", "");
        let { userId } = dataToken(token);
        let user = await model.users.findOne({
            where: { user_id: userId }
        })
        if (!user) return responseApi(res, 400, '', 'Người dùng không tồn tại')
        bcrypt.hash(newPassword, 10, async (err, hash) => {
            if (err) {
                responseApi(res, 500, "", "Lỗi server !")
            }
            await model.users.update(
                { ...user, password: hash }, {
                where: {
                    user_id: user.dataValues.user_id
                }
            })
            responseApi(res, 200, hash, "Cập nhật mật khẩu thành công !")
        })

    } catch (error) {
        console.log(error)
        responseApi(res, 400, "", "Xử lý không thành công!")
    }
};

const changeInfo = async (req, res) => {
    try {
        let { userName } = req.body;
        let { authorization } = req.headers;
        const token = authorization.replace("Bearer ", "");
        let { userId } = dataToken(token);
        let data = await model.users.findOne({
            where: { user_id: userId }
        });
        await model.users.update({
            ...data, user_name: userName
        }, {
            where: { user_id: data.dataValues.user_id }
        });
        responseApi(res, 200, '', 'Đổi tên thành công!')
    } catch (error) {
        responseApi(res, 400, '', 'Xử lý không thành công!')
    }
};

const listImageSaveByUser = async (req, res) => {
    try {
        let { authorization } = req.headers;
        const token = authorization.replace("Bearer ", "");
        let { userId } = dataToken(token);
        let data = await model.saves.findAll({
            where: {
                user_id: userId
            },
            include: ['image', 'user']
        });
        responseApi(res, 200, data, 'Thành công!')
    } catch (error) {
        console.log(error)
        responseApi(res, 400, '', 'Xử lý không thành công!')
    }
};

const listImageCreateByUser = async (req, res) => {
    try {
        let { authorization } = req.headers;
        const token = authorization.replace("Bearer ", "");
        let { userId } = dataToken(token);
        let data = await model.images.findAll({
            where: {
                user_id: userId
            },
            include: ['user']
        });
        responseApi(res, 200, data, 'Thành công!')
    } catch (error) {
        console.log(error)
        responseApi(res, 400, '', 'Xử lý không thành công!')
    }
};

export {
    login,
    register,
    resetToken,
    changePassword,
    changeInfo,
    infoUser,
    listImageSaveByUser,
    listImageCreateByUser
}