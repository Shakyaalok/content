
const db = require('../models/modelindex')

const K12 = db.k12
const Enterprise = db.Enterprises;
const HigherEd = db.HigherEd


exports.getContents = async (req, res) => {
    let contents = [];
    let content;
    try {
        content = await K12.findAll({});
        contents.push(...content);
        content = await HigherEd.findAll({})
        contents.push(...content);
        res.json(contents)
    } catch (error) {
        return res.status(500).json({ message: 'something went wrong', error: true })
    }
}


exports.K12 = async (req, res) => {
    try {
        let contents = await K12.findAll({});
        res.json(contents)
    } catch (error) {
        return res.status(500).json({ message: 'something went wrong', error: true })
    }
}


exports.HigherEd = async (req, res) => {
    try {
        let contents = await HigherEd.findAll({});
        res.json(contents)
    } catch (error) {
        return res.status(500).json({ message: 'something went wrong', error: true })

    }

}
