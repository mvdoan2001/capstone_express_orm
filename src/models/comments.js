import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class comments extends Model {
  static init(sequelize, DataTypes) {
  return super.init({
    comment_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    content: {
      type: DataTypes.STRING(1000),
      allowNull: true
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'users',
        key: 'user_id'
      }
    },
    image_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'images',
        key: 'image_id'
      }
    },
    create_at: {
      type: DataTypes.DATE,
      allowNull: true
    },
    isDelete: {
      type: DataTypes.BOOLEAN,
      allowNull: true,
      defaultValue: 0
    }
  }, {
    sequelize,
    tableName: 'comments',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "comment_id" },
        ]
      },
      {
        name: "user_id",
        using: "BTREE",
        fields: [
          { name: "user_id" },
        ]
      },
      {
        name: "image_id",
        using: "BTREE",
        fields: [
          { name: "image_id" },
        ]
      },
    ]
  });
  }
}
