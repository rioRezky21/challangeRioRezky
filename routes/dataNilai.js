const express = require('express')
const router = express.Router()
const dataNilaiController = require('../controller/dataNilai')

router.post('/', dataNilaiController.post)
router.put('/:nim/:id', dataNilaiController.put)
router.delete('/:nim/:id', dataNilaiController.delete)

module.exports = router