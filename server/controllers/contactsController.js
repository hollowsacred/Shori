const { PrismaClient } = require("@prisma/client");
const fs = require("fs");
const path = require("path");

const prisma = new PrismaClient();

class ContactsController {
  async getAllContacts(req, res) {
    const contacts = await prisma.pickPoint.findMany({

    })

    res.status(200).json(contacts)
  }
}

module.exports = new ContactsController();