const { PrismaClient } = require("@prisma/client");
const fs = require("fs");
const path = require("path");

const prisma = new PrismaClient();

class UsersController {
  async getAllAdmins(req, res) {
    const users = await prisma.user.findMany({
      where: {
        roleId: 1,
      }
    })
   return res.status(200).json(users);
  }
  async addAdmin(req, res) {
    const { body } = req;
    const admin = await prisma.user.create({
      data: {
        email: body.email,
        login: body.login,
        password: body.password,
        roleId: 1,
      }
    })
    return res.status(200).json('Администратор успешно добавлен');
  }
  async deleteAdmin(req, res) {
    const { params } = req;
    const admin = await prisma.user.delete({
      where: {
        id: +params.id,
      }
    });
    return res.status(200).json('Администратор удален');
  }
}

module.exports = new UsersController();