var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var ImageSchema = new Schema({
  filename: {
    type: String,
    required: true
  },
  filetype: {
    type: String,
    required: false
  },
  value: {
    type: String,
    required: true
  },
  postedBy: {
    user: {type: Schema.ObjectId, ref:"User"},
  },
  comments: [{
    type: String,
  }]
});

module.exports = mongoose.model('Image', ImageSchema);
