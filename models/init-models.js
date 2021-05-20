var DataTypes = require("sequelize").DataTypes;
var _data_nilai = require("./data_nilai");
var _dosen = require("./dosen");
var _mahasiswa = require("./mahasiswa");
var _mata_kuliah = require("./mata_kuliah");
var _mata_kuliah_junction = require("./mata_kuliah_junction");
var _user_role = require("./user_role");
var _users = require("./users");

function initModels(sequelize) {
  var data_nilai = _data_nilai(sequelize, DataTypes);
  var dosen = _dosen(sequelize, DataTypes);
  var mahasiswa = _mahasiswa(sequelize, DataTypes);
  var mata_kuliah = _mata_kuliah(sequelize, DataTypes);
  var mata_kuliah_junction = _mata_kuliah_junction(sequelize, DataTypes);
  var user_role = _user_role(sequelize, DataTypes);
  var users = _users(sequelize, DataTypes);

  mahasiswa.belongsToMany(mata_kuliah, { as: 'id_mata_kuliah_mata_kuliahs', through: data_nilai, foreignKey: "nim", otherKey: "id_mata_kuliah" });
  mahasiswa.belongsToMany(mata_kuliah, { as: 'id_mata_kuliah_mata_kuliah_mata_kuliah_junctions', through: mata_kuliah_junction, foreignKey: "nim", otherKey: "id_mata_kuliah" });
  mata_kuliah.belongsToMany(mahasiswa, { as: 'nim_mahasiswas', through: data_nilai, foreignKey: "id_mata_kuliah", otherKey: "nim" });
  mata_kuliah.belongsToMany(mahasiswa, { as: 'nim_mahasiswa_mata_kuliah_junctions', through: mata_kuliah_junction, foreignKey: "id_mata_kuliah", otherKey: "nim" });
  data_nilai.belongsTo(dosen, { as: "id_dosen_dosen", foreignKey: "id_dosen"});
  dosen.hasMany(data_nilai, { as: "data_nilais", foreignKey: "id_dosen"});
  data_nilai.belongsTo(mahasiswa, { as: "nim_mahasiswa", foreignKey: "nim"});
  mahasiswa.hasMany(data_nilai, { as: "data_nilais", foreignKey: "nim"});
  mata_kuliah_junction.belongsTo(mahasiswa, { as: "nim_mahasiswa", foreignKey: "nim"});
  mahasiswa.hasMany(mata_kuliah_junction, { as: "mata_kuliah_junctions", foreignKey: "nim"});
  data_nilai.belongsTo(mata_kuliah, { as: "id_mata_kuliah_mata_kuliah", foreignKey: "id_mata_kuliah"});
  mata_kuliah.hasMany(data_nilai, { as: "data_nilais", foreignKey: "id_mata_kuliah"});
  mata_kuliah_junction.belongsTo(mata_kuliah, { as: "id_mata_kuliah_mata_kuliah", foreignKey: "id_mata_kuliah"});
  mata_kuliah.hasMany(mata_kuliah_junction, { as: "mata_kuliah_junctions", foreignKey: "id_mata_kuliah"});
  users.belongsTo(user_role, { as: "role_user_role", foreignKey: "role"});
  user_role.hasMany(users, { as: "users", foreignKey: "role"});

  return {
    data_nilai,
    dosen,
    mahasiswa,
    mata_kuliah,
    mata_kuliah_junction,
    user_role,
    users,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
