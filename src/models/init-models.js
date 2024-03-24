import _sequelize from "sequelize";
const DataTypes = _sequelize.DataTypes;
import _comments from  "./comments.js";
import _images from  "./images.js";
import _saves from  "./saves.js";
import _users from  "./users.js";

export default function initModels(sequelize) {
  const comments = _comments.init(sequelize, DataTypes);
  const images = _images.init(sequelize, DataTypes);
  const saves = _saves.init(sequelize, DataTypes);
  const users = _users.init(sequelize, DataTypes);

  comments.belongsTo(images, { as: "image", foreignKey: "image_id"});
  images.hasMany(comments, { as: "comments", foreignKey: "image_id"});
  saves.belongsTo(images, { as: "image", foreignKey: "image_id"});
  images.hasMany(saves, { as: "saves", foreignKey: "image_id"});
  comments.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(comments, { as: "comments", foreignKey: "user_id"});
  images.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(images, { as: "images", foreignKey: "user_id"});
  saves.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(saves, { as: "saves", foreignKey: "user_id"});

  return {
    comments,
    images,
    saves,
    users,
  };
}
