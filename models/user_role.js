const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('user_role', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    role: {
      type: DataTypes.STRING(255),
      allowNull: false,
      unique: "user_role_role_key"
    }
  }, {
    sequelize,
    tableName: 'user_role',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "user_role_pkey",
        unique: true,
        fields: [
          { name: "id" },
        ]
      },
      {
        name: "user_role_role_key",
        unique: true,
        fields: [
          { name: "role" },
        ]
      },
    ]
  });
};
