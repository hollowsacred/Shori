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
  async getProductById(req, res) {
    const { params } = req;

    const product = await prisma.product.findFirst({
      where: {
        id: +params.id
      },
    })
    return res.status(200).json(product);
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
          belongs: body.belongs,
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

    await prisma.basketProduct.deleteMany({
      where: {
        productId: +params.id,

      }
    })

    const product = await prisma.product.delete({
      include: {
        basketProduct: {
          select: {
            basketId:true,
          }
        }
      },
      where:{
        id:+params.id,
      }

    })
    console.log(product);


    return res.status(200).json(product);
  }
  async changeItemProduct(req, res) {
    const {body} = req;
    console.log(body);
      await prisma.product.update({
        where: {
          id:+body.id,
        },
        data: {
          title:body.title,
          price:+body.price,
          oldPrice:+body.oldPrice,

        }
      })
      res.status(200).json('Файл изменен');
  }
}

module.exports = new ProductsController();
