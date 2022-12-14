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
}

module.exports = new AuthController();