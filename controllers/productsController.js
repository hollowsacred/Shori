const { PrismaClient } = require("@prisma/client");
const fs = require("fs");
const path = require("path");

const prisma = new PrismaClient();

class ProductsController {
  async getAllProduct(req, res) {
    const products = await prisma.product.findMany({
      include: {
        category: {
          select: {
            name: true,
          },
        },
      },
    });
    return res.status(200).json(products);
  }

  async addProduct(req, res) {
    try {
      const { body } = req;
      const fileImg = req.files.File;
      const srcImg = path.resolve("static", fileImg.name);
      fileImg.mv(srcImg);
      const product = await prisma.product.create({
        data: {
          count: +body.count,
          img: fileImg.name,
          price: +body.price,
          oldPrice: +body.oldPrice,
          title: body.title,
          category: {
            connect: {
              id: +body.category,
            },
          },
        },
      });

      const nameCategory = await prisma.product.findFirst({
        where: {
          id: product.id,
        },
        select: {
          category: {
            select: {
              name: true,
            },
          },
        },
      });
      product.category = {
        name: nameCategory.category.name,
      };
      return res.status(200).json(product);
    } catch (error) {
      console.log(error.message);
    }
  }
  async deleteItem(req, res) {
    const {params} = req;
    const product = await prisma.product.delete({
      where:{
        id:+params.id,
      }
    })
    return res.status(200).json(product);
  }
}

module.exports = new ProductsController();
