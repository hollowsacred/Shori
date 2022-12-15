const productsController = require('./controllers/productsController');
const Router  = require('express');
const authConroller = require('./controllers/authConroller');
const cartController = require('./controllers/cartController');
// const multer = require('multer');

const router = new Router();
// const upload = multer();
router.get('/products', productsController.getAllProduct);
router.post('/products', productsController.addProduct);
router.delete('/products/:id', productsController.deleteItem);
router.post('/auth', authConroller.tryToLogin);
router.post('/reg',authConroller.tryToReg);
router.post('/cart', cartController.addItemToCart);
router.get('/cart', cartController.getAllItemsCart);
router.delete('/cart/:id', cartController.deleteItemFromCart)
module.exports = router;