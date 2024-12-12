const express = require('express');
const ProductController = require('../controllers/ProductController');
const TraceProductController = require('../controllers/TraceProductController');

const router = express.Router();

// Product Routes
router.get('/products', ProductController.getAllProducts);
router.post('/products', ProductController.addProduct);
router.put('/products/:id', ProductController.updateProduct);
router.delete('/products/:id', ProductController.deleteProduct);

// Trace Routes
router.post('/trace', TraceProductController.addTrace);

module.exports = router;
