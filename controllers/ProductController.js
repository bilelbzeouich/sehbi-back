const db = require('../db/db-connection');
const sendEmail = require('../utils/mailer');
// Fetch all products
exports.getAllProducts = async (req, res) => {
    try {
        const [rows] = await db.query('SELECT * FROM products');
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Failed to fetch products' });
    }
};

// Add a new product
exports.addProduct = async (req, res) => {
    const { name, description, price } = req.body;
    try {
        await db.query('INSERT INTO products (name, description, price) VALUES (?, ?, ?)', [name, description, price]);
        res.status(201).send('Product added successfully');
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Failed to add product' });
    }
};

// Assuming your mailer is in utils/mailer.js

// Update an existing product and notify traced clients
exports.updateProduct = async (req, res) => {
    const { id } = req.params;
    const { name, description, price } = req.body;

    try {
        // Update the product
        await db.query(
            'UPDATE products SET name = ?, description = ?, price = ?, updated_at = NOW() WHERE id = ?',
            [name, description, price, id]
        );

        // Fetch all client emails tracing this product
        const [tracedClients] = await db.query(
            'SELECT client_email FROM trace_products WHERE product_id = ?',
            [id]
        );

        // Notify all traced clients via email
        const emailPromises = tracedClients.map(({ client_email }) =>
            sendEmail(
                client_email,
                'Product Update Notification',
                `The product "${name}" that you are tracing has been updated. Check it out for the latest details.`
            )
        );

        // Wait for all emails to be sent
        await Promise.all(emailPromises);

        res.send('Product updated successfully, and notifications sent to traced clients');
    } catch (error) {
        console.error('Error updating product and notifying clients:', error);
        res.status(500).json({ message: 'Failed to update product' });
    }
};

// Delete a product
exports.deleteProduct = async (req, res) => {
    const { id } = req.params;
    try {
        await db.query('DELETE FROM products WHERE id = ?', [id]);
        res.send('Product deleted successfully');
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Failed to delete product' });
    }
};
