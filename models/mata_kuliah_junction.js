const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('mata_kuliah_junction', {
    id_mata_kuliah: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'mata_kuliah',
        key: 'id'
      }
    },
    nim: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'mahasiswa',
        key: 'nim'
      }
    }
  }, {
    sequelize,
    tableName: 'mata_kuliah_junction',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "mata_kuliah_pk",
        unique: true,
        fields: [
          { name: "id_mata_kuliah" },
          { name: "nim" },
        ]
      },
    ]
  });
};
