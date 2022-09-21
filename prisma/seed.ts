import { prisma } from "../src/database/prismaClient";

const main = async () => {
  console.log("Test");
  const createCategories = await prisma.category.createMany({
    data: [
      { name: "Tradicional" },
      { name: "Gelado" },
      { name: "Com leite" },
      { name: "Especial" },
      { name: "Alcoólico" },
    ],
    skipDuplicates: true,
  });
  console.log(createCategories);
  const createCoffees = await prisma.coffee.createMany({
    data: [
      {
        name: "Expresso Tradicional",
        description: "O tradicional café feito com água quente e grãos moídos",
        price: 10.0,
      },
      {
        name: "Expresso Americano",
        description: "Expresso diluído, menos intenso que o tradicional",
        price: 12.0,
      },
      {
        name: "Expresso Cremoso",
        description: "Café expresso tradicional com espuma cremosa",
        price: 14.0,
      },
      {
        name: "Expresso Gelado",
        description: "Bebida preparada com café expresso e cubos de gelo",
        price: 13.5,
      },
      {
        name: "Café com leite",
        description:
          "Meio a meio de expresso tradicional com leite vaporizadoo",
        price: 9.9,
      },
      {
        name: "Latte",
        description:
          "Uma dose de café expresso com o dobro de leite e espuma cremosa",
        price: 17.0,
      },
      {
        name: "Capuccino",
        description:
          "Bebida com canela feita de doses iguais de café, leite e espuma",
        price: 12.1,
      },
      {
        name: "Macchiato",
        description:
          "Café expresso misturado com um pouco de leite quente e espuma",
        price: 14.0,
      },
      {
        name: "Mocaccino",
        description:
          "Café expresso com calda de chocolate, pouco leite e espuma",
        price: 20.0,
      },
      {
        name: "Chocolate Quente",
        description:
          "Bebida feita com chocolate dissolvido no leite quente e café",
        price: 22.3,
      },
      {
        name: "Cubano",
        description:
          "Drink gelado de café expresso com rum, creme de leite e hortelã",
        price: 17.0,
      },
      {
        name: "Havaiano",
        description: "Bebida adocicada preparada com café e leite de coco",
        price: 18.0,
      },
      {
        name: "Árabe",
        description: "Bebida preparada com grãos de café árabe e especiarias",
        price: 18.5,
      },
      {
        name: "Irlândes",
        description:
          "Bebida a base de café, uísque irlandês, açúcar e chantilly",
        price: 16.0,
      },
    ],
    skipDuplicates: true,
  });
  const createCoffeeCategory = await prisma.coffee_category.createMany({
    data: [
      { coffee_id: 1, category_id: 1 },
      { coffee_id: 2, category_id: 1 },
      { coffee_id: 3, category_id: 1 },
      { coffee_id: 4, category_id: 1 },
      { coffee_id: 4, category_id: 2 },
      { coffee_id: 5, category_id: 1 },
      { coffee_id: 5, category_id: 3 },
      { coffee_id: 6, category_id: 1 },
      { coffee_id: 6, category_id: 3 },
      { coffee_id: 7, category_id: 1 },
      { coffee_id: 7, category_id: 3 },
      { coffee_id: 8, category_id: 1 },
      { coffee_id: 8, category_id: 3 },
      { coffee_id: 9, category_id: 3 },
      { coffee_id: 9, category_id: 4 },
      { coffee_id: 10, category_id: 4 },
      { coffee_id: 10, category_id: 3 },
      { coffee_id: 10, category_id: 2 },
      { coffee_id: 11, category_id: 4 },
      { coffee_id: 12, category_id: 4 },
      { coffee_id: 13, category_id: 4 },
      { coffee_id: 13, category_id: 5 },
    ],
    skipDuplicates: true,
  });
};

main();
