const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(bodyParser.json());

// Connect to MongoDB
// mongoose.connect('mongodb://localhost:27017/NewDocket', { useNewUrlParser: true, useUnifiedTopology: true });
mongoose.connect(process.env.MongoDB_URI).then(
  () => {
    console.log('Database connected successfully');
  }
).catch(err => {
  console.log('Unable to connect to the database. Error:', err);
});

// Define your MongoDB schema and model here using mongoose
const {Schema} = mongoose;

const userSchema = new Schema({
    name:{
        type:String,
        required:true
    },
    mobile:{
        type:Number,
        required:true,
        unique:true
    },
    email:{
        type:String,
        required:true,
        unique:true,
        lowercase:true
    },
    password:{
        type:String,
        required:true
    } 
});

const User = mongoose.model('User', userSchema);

// Define your API routes here
app.get('/', (req, res) => {
    res.send('Hello World!');
    });

app.post('/api/register', async (req, res) => {
    try {
      // Extract email and password from the request body
      const { name, mobile, email, password } = req.body;
  
      // Check if the email already exists
      const existingUser = await User.findOne({ email });
      if (existingUser) {
        return res.status(400).json({ message: 'Email already exists' });
      }

      if (existingUser) {
        return res.status(400).json({ message: 'Mobile already exists' });
      }
  
      // Create a new user
      const newUser = new User({ name, mobile, email, password });
  
      // Save the user to the database
      await newUser.save();
  
      // Respond with a success message
      res.status(201).json({ message: 'User registered successfully' });
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Internal server error' });
    }
  });

app.listen(PORT, () => {
  console.log(`Server is running`);
});
