const { PrismaClient } = require("@prisma/client");
const fs = require("fs");
const path = require("path");

const prisma = new PrismaClient();

class CommentsController {
  async getAllCommentsById(req, res) {
    const { params } = req;
    const comments = await prisma.comments.findMany({
      where: {
        productId: +params.id,
      },
      include: {
        user: {
          select: {
            login: true,
          }
        }
      }
    })
    console.log(comments);
    res.status(200).json(comments);
  }
  async addComment(req, res) {
    const { body } = req;
    console.log(body);
    const comment = await prisma.comments.create({
      data: {
        productId: +body.productId,
        userId: +body.userId,
        description: body.description,
        likes: 0,
        date: new Date().toISOString(),
      }
    });

    res.status(200).json(comment);
  }
}

module.exports = new CommentsController();