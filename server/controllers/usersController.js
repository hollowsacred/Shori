const { PrismaClient } = require("@prisma/client");
const fs = require("fs");
const path = require("path");

const prisma = new PrismaClient();

class UsersController {
  async getAllManagers(req, res) {
    const users = await prisma.user.findMany({
      where: {
        roleId: 3,
      }
    })
   return res.status(200).json(users);
  }
  async addManager(req, res) {
    const { body } = req;
    const manager = await prisma.user.create({
      data: {
        email: body.email,
        login: body.login,
        password: body.password,
        roleId: 3,
      },
      select: {
        id: true,
      }
    });

    console.log(manager, 'менедлжер')
    await prisma.basket.create({
      data: {
        user: {
          connect: {
            id: +manager.id,
          }
        }
      }
    })
    return res.status(200).json('Администратор успешно добавлен');
  }
  async deleteAdmin(req, res) {
    const { params } = req;
    
    console.log(params, 'параметры');
    const basket = await prisma.basket.findFirst({
      where: {
        userId: +params.id,
      }
    });
    await prisma.basketProduct.deleteMany({
      where: {
        basketId: +basket.id,
      }
    });
    await prisma.basket.delete({
      where: {
        id: +basket.id,
      }
    });
    const manager = await prisma.user.delete({
      where: {
        id: +params.id,
      }
    });

    



    return res.status(200).json('Администратор удален');
  }
}

module.exports = new UsersController();