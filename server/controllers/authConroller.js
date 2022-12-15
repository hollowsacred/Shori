const { PrismaClient } = require("@prisma/client");
const fs = require("fs");
const path = require("path");

const prisma = new PrismaClient();

class AuthController {
  async tryToLogin(req, res) {
    const {body} = req;
    const isLogin = await prisma.user.findFirst({
      where: {
        login: body.login,
        password: body.password,
      },
      include: {
        role:{
          select:{
            name:true,
          }
        }
      }
    })
   return res.status(200).json(isLogin);
  }

  async tryToReg(req, res) {
    const {body} = req;
    console.log(body);
    console.log(count,'fsdfsdf');
    const user = await prisma.user.create({
      data: {
        login: body.login,
        password: body.password,
        email: body.email,
        roleId:2,
        basket: {
         create: {

         }
        }

           
      }
    });
    res.status(200).json("Пользователь успешно добавлен!");
  }
}

module.exports = new AuthController();