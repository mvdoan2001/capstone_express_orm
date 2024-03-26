import jwt from 'jsonwebtoken';
import responseApi from './reponse.js';

export const createToken = (data) => jwt.sign(data, '1234', { algorithm: 'HS256', expiresIn: '1d' });
export const checkToken = (token) => jwt.verify(token, '1234', (err, decode) => err);
export const dataToken = (token) => jwt.decode(token);

export const createTokenRef = (data) => jwt.sign(data, '12345', { algorithm: 'HS256', expiresIn: '7d' });

export const checkTokenRef = (token) => jwt.verify(token, '12345', (err, decode) => err);

export const midVerifyToken = (req, res, next) => {
    let { authorization } = req.headers;
    const token = authorization.replace("Bearer ", "");
    let check = checkToken(token);
    if(check == null) {
        next();
    } else {
    responseApi(res, 200, '', check)
    }
};