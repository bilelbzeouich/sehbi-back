const db = require('../db/db-connection');
const sendEmail = require('../utils/mailer');

// Add product to trace list
exports.addTrace = async (req, res) => {
    const { product_id, client_email } = req.body;
    try {
        await db.query('INSERT INTO trace_products (product_id, client_email) VALUES (?, ?)', [product_id, client_email]);
        res.status(201).send('Product added to trace successfully');
    } catch (error) {
        console.error('Error adding product to trace:', error);
        res.status(500).json({ message: 'Failed to add product to trace' });
    }
};

// Notify clients about product updates
exports.notifyClients = async (productId) => {
    try {
        const [rows] = await db.query(
            'SELECT client_email FROM trace_products WHERE product_id = ?',
            [productId]
        );

        // Sending emails to all clients asynchronously
        const emailPromises = rows.map(({ client_email }) =>
            sendEmail(client_email, 'Product Updated', 'A product you are tracing has been updated.')
        );

        // Wait for all emails to be sent
        await Promise.all(emailPromises);
        console.log(`Notifications sent to all clients for product ID ${productId}`);
    } catch (error) {
        console.error('Error notifying clients:', error);
    }
};
