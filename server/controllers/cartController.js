const { PrismaClient } = require("@prisma/client");
const fs = require("fs");
const path = require("path");

const prisma = new PrismaClient();

class CartController {
  async addItemToCart(req, res) {
    const { body } = req;
    console.log(body);
    const basket = await prisma.basket.findFirst({
      where: {
        userId: +body.user,
      }
    });
    const findedInfo = await prisma.basketProduct.findFirst({
      select: {
        count: true,
        id: true,
      },
      where: {
        basketId: +basket.id,
        productId: +body.product,
      },
    });
    if (findedInfo) {
      await prisma.basketProduct.update({
        where: {
          id: findedInfo.id,
        },
        data: {
          count: findedInfo.count + +body.count,
        },
      });
    } else {
      await prisma.basketProduct.create({
        data: {
          basketId: +basket.id,
          productId: +body.product,
          count: +body.count,
        },
      });
    }
    const itemCart = await prisma.basketProduct.findFirst({
      where: {
        basketId: +basket.id,
        productId: +body.product,
      },
      select: {
        id: true,
        basketId: true,
        count: true,
        basket: {
          select: {
            userId:true,
          }
        },
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
        basket: {
          select: {
            userId: true,
          }
        },
        product: {
          include: {
            category: {},
          },
        },
      },
    });
    return res.status(200).json(itemsCart);
  }

  async getAllItemsCartById(req, res) {
    const { params } = req
    const itemsCart = await prisma.basketProduct.findMany({
      where: {
        basket: {
          userId: +params.id,
        }
      },
      select: {
        id: true,
        basketId: true,
        count: true,
        basket: {
          select: {
            userId: true,
          }
        },
        product: {
          include: {
            category: {},
          },
        },
      },
    })
    return res.status(200).json(itemsCart);
  }

  async clearCart(req, res) {
    const { params } = req;

    const basket = await prisma.basket.findFirst({
      where: {
        userId: +params.id,
      }
    });

    await prisma.basketProduct.deleteMany({
      where: {
        basketId: +basket.id,
      },
    });
    res.status(200).json("Успешно удален");
  }
  async deleteItem(req, res) {
    const {params} = req;
    console.log(params);

    const basket = await prisma.basket.findFirst({
      where: {
        userId: +params.id,
      }
    });

      await prisma.basketProduct.deleteMany({
        where: {
          basketId: +basket.id,
          productId: +params.productId,
        },

      })
      res.status(200).json("Товар удален");
  }
}

module.exports = new CartController();
