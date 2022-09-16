import { PrismaClient } from "@prisma/client";
/*pegando as informações do meu banco de dados e deixando disponível para de 
forma mais fácil para os outros arquivos da aplicação
*/
const prisma = new PrismaClient();

export { prisma };
