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
router.post('/product', productsController.changeItemProduct)
router.post('/auth', authConroller.tryToLogin);
router.post('/reg',authConroller.tryToReg);
router.post('/cart', cartController.addItemToCart);
router.get('/cart', cartController.getAllItemsCart);
router.delete('/cart/allclear/:id', cartController.clearCart)
router.delete('/cart/:id/:productId', cartController.deleteItem);
module.exports = router;