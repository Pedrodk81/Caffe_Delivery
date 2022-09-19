import { Router } from "express";

import { CreateClientController } from "./modules/clients/useCase/createClients/CreateClientController";
import { FindAllDeliveriesController } from "./modules/clients/useCase/deliveries/FindAllDeliveriesController";

const routes = Router();

const createClientController = new CreateClientController();
const findAllDeliveriesClients = new FindAllDeliveriesController();

routes.post("/client", createClientController.handle);

routes.get(
  "/clients/deliveries" /* preciso fazer a validação do usuário */,
  findAllDeliveriesClients.handle
);

export { routes };
