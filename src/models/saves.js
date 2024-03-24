import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class saves extends Model {
  static init(sequelize, DataTypes) {
  return super.init({
    save_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
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
    isSave: {
      type: DataTypes.BOOLEAN,
      allowNull: true,
      defaultValue: 0
    }
  }, {
    sequelize,
    tableName: 'saves',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "save_id" },
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
