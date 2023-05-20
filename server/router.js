const productsController = require('./controllers/productsController');
const Router  = require('express');
const authConroller = require('./controllers/authConroller');
const cartController = require('./controllers/cartController');
const commentsController = require('./controllers/commentsController');
const usersController = require('./controllers/usersController');
const contactsController = require('./controllers/contactsController');

// const multer = require('multer');

const router = new Router();
// const upload = multer();
router.get('/products', productsController.getAllProduct);
router.post('/products', productsController.addProduct);
router.delete('/products/:id', productsController.deleteItem);
router.post('/product', productsController.changeItemProduct);
router.get('/product/:id', productsController.getProductById);
router.get('/comments/:id', commentsController.getAllCommentsById);
router.post('/comments', commentsController.addComment);
router.post('/auth', authConroller.tryToLogin);
router.post('/reg', authConroller.tryToReg);
router.get('/users', usersController.getAllManagers);
router.post('/users', usersController.addManager);
router.delete('/user/:id', usersController.deleteAdmin);
router.post('/cart', cartController.addItemToCart);
router.get('/cart', cartController.getAllItemsCart);
router.get('/cart/:id', cartController.getAllItemsCartById);
router.delete('/cart/allclear/:id', cartController.clearCart)
router.delete('/cart/:id/:productId', cartController.deleteItem);
router.get('/contacts', contactsController.getAllContacts);
module.exports = router;