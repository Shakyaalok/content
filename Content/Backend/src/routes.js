const express = require('express');
const router = express.Router();
const authController = require('./controllers/auth.controller')
const contentController = require('./controllers/content.controller')

router.post('/login', authController.login)
router.post('/logout', authController.logout)


router.get('/contents',  authController.authenticateJWT,  contentController.getContents)
router.get('/k12',       authController.authenticateJWT,  contentController.K12);
router.get('/higher-ed', authController.authenticateJWT,  contentController.HigherEd);


module.exports = router;