const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('dosen', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    nama: {
      type: DataTypes.STRING(255),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'dosen',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "dosen_pkey",
        unique: true,
        fields: [
          { name: "id" },
        ]
      },
    ]
  });
};
