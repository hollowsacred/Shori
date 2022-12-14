const productsController = require('./controllers/productsController');
const Router  = require('express');
const authConroller = require('./controllers/authConroller');
// const multer = require('multer');

const router = new Router();
// const upload = multer();
router.get('/products', productsController.getAllProduct);
router.post('/products', productsController.addProduct);
router.delete('/products/:id', productsController.deleteItem);
router.post('/auth', authConroller.tryToLogin);
module.exports = router;