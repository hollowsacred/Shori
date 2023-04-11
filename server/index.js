const { PrismaClient } = require('@prisma/client');
const express  = require('express')
const cors = require('cors')
const router = require('./router.js');
const path = require('path');
const fileUpload = require('express-fileupload');
const app = express();
const prisma = new PrismaClient();
const hostname = '127.0.0.1';
const PORT = 5000;

console.log('я пуж');

app.use(express.json());
app.use(cors());
app.use(fileUpload({}));
app.use('/static', express.static('./static/'));
app.use('/api', router);

app.get('/', async (req, res) => {
   const users = await prisma.product.findMany({
      include: {
        category: {
          select: {
            name:true,
          }
        }
      }
    })
    res.status(200).json(users);
})

async function startApp() {
  try {
    app.listen(PORT, hostname, () => {console.log('сервер запущен')});
  } catch (error) {
      console.log(error)
  }
}

startApp();


