
const {Sequelize, DataTypes, Op} = require('sequelize');
const sequelize = require('../../config/db.config1')

const db ={}

db.Sequelize = Sequelize
db.sequelize = sequelize
db.Op = Op

db.k12 = require('./K12.model')(sequelize, DataTypes);
db.Enterprises = require('./enterprises.models')(sequelize,DataTypes);
db.HigherEd = require('./higherEd')(sequelize,DataTypes);
db.User = require('./user')(sequelize,DataTypes)


db.sequelize.sync({force : false})
.then(()=> {
    console.log('yes re-sync done!')
})


module.exports = db