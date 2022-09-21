import { Router } from "express";

import { CreateClientController } from "./modules/clients/useCase/createClients/CreateClientController";
import { FindAllDeliveriesController } from "./modules/clients/useCase/deliveries/FindAllDeliveriesController";
import { CoffeesController } from "./controllers/Coffees";
import { UserController } from "./controllers/User";
const routes = Router();

const createClientController = new CreateClientController();
const findAllDeliveriesClients = new FindAllDeliveriesController();

// routes.post("/client/", createClientController.handle);

routes.get(
  "/clients/deliveries" /* preciso fazer a validação do usuário */,
  findAllDeliveriesClients.handle
);

routes.post("/client", UserController.createUser);

routes.get("/coffees", CoffeesController.listCoffees);

routes.post("/order", CoffeesController.listCoffees);

export { routes };
