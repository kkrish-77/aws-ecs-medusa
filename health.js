const express = require('express');
const app = express();
const port = 9000;

// Health check endpoint
app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'healthy',
    timestamp: new Date().toISOString(),
    service: 'medusa-commerce'
  });
});

// Root endpoint
app.get('/', (req, res) => {
  res.json({
    message: 'Medusa Commerce API',
    status: 'running',
    version: '1.0.0'
  });
});

// Start server
app.listen(port, () => {
  console.log(`🚀 Medusa server running on port ${port}`);
  console.log(`🏥 Health check available at http://localhost:${port}/health`);
});

module.exports = app; 