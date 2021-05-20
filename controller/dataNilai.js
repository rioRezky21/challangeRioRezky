const model = require('../models/index')

module.exports = {
    post: async function (req, res, next) {
        try {
            const {
                nim,
                id_mata_kuliah,
                id_dosen,
                nilai,
                keterangan
            } = req.body;
            const dataNilai = await model.data_nilai.create({
                nim,
                id_mata_kuliah,
                id_dosen,
                nilai,
                keterangan
            });
            if (dataNilai) {
                res.status(201).json({
                    'status': 'OK',
                    'messages': 'data nilai berhasil ditambahkan',
                    'data': dataNilai,
                })
            }
        } catch (err) {
            res.status(400).json({
                'status': 'ERROR',
                'messages': err.message,
                'data': {},
            })
        }
    },
    put: async function (req, res, next) {
        try {
            const nim = req.params.nim;
            const idMataKuliah = req.params.id;
            const {
                id_dosen,
                nilai,
                keterangan
            } = req.body;
            const dataNilai = await model.data_nilai.update({
                id_dosen,
                nilai,
                keterangan
            }, {
                where: {
                    nim: nim,
                    id_mata_kuliah: idMataKuliah
                }
            });
            if (dataNilai) {
                res.json({
                    'status': 'OK',
                    'messages': 'data nilai berhasil diupdate',
                    'data': dataNilai,
                })
            }
        } catch (err) {
            res.status(400).json({
                'status': 'ERROR',
                'messages': err.message,
                'data': {},
            })
        }
    },
    delete: async function (req, res, next) {
        try {
            const nim = req.params.nim;
            const idMataKuliah = req.params.id;
            const dataNilai = await model.data_nilai.destroy({
                where: {
                    nim: nim,
                    id_mata_kuliah: idMataKuliah
                }
            })
            if (dataNilai) {
                res.json({
                    'status': 'OK',
                    'messages': 'data nilai berhasil dihapus',
                    'data': dataNilai,
                })
            }
        } catch (err) {
            res.status(400).json({
                'status': 'ERROR',
                'messages': err.message,
                'data': {},
            })
        }
    }
}