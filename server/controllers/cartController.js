const { PrismaClient } = require("@prisma/client");
const fs = require("fs");
const path = require("path");

const prisma = new PrismaClient();

class CartController {
  async addItemToCart(req, res) {
    const { body } = req;
    console.log(body);
    const findedInfo = await prisma.basketProduct.findFirst({
      select: {
        count: true,
        id: true,
      },
      where: {
        basketId: +body.user,
        productId: +body.product,
      },
    });
    if (findedInfo) {
      await prisma.basketProduct.update({
        where: {
          id: findedInfo.id,
        },
        data: {
          count: findedInfo.count + 1,
        },
      });
    } else {
      await prisma.basketProduct.create({
        data: {
          basketId: +body.user,
          productId: +body.product,
          count: 1,
        },
      });
    }
    const itemCart = await prisma.basketProduct.findFirst({
      where: {
        basketId: +body.user,
        productId: +body.product,
      },
      select: {
        id: true,
        basketId: true,
        count: true,
        product: {
          include: {
            category: {},
          },
        },
      },
    });

    res.status(200).json(itemCart);
  }

  async getAllItemsCart(req, res) {
    const itemsCart = await prisma.basketProduct.findMany({
      select: {
        id: true,
        basketId: true,
        count: true,
        product: {
          include: {
            category: {},
          },
        },
      },
    });
    return res.status(200).json(itemsCart);
  }

  async clearCart(req, res) {
    const { params } = req;
    await prisma.basketProduct.deleteMany({
      where: {
        basketId: +params.id,
      },
    });
    res.status(200).json("Успешно удален");
  }
  async deleteItem(req, res) {
    const {params} = req;
    console.log(params);
      await prisma.basketProduct.deleteMany({
        where: {
          basketId: +params.id,
          productId: +params.productId,
        },

      })
      res.status(200).json("Товар удален");
  }
}

module.exports = new CartController();
