import { Router } from "express";
import validateToken from "./middlewares/validateToken";
import OrderController from "./controllers/Order";
import { CoffeesController } from "./controllers/Coffee";
import UserController from "./controllers/User";
import AuthController from "./controllers/Auth";

const routes = Router();

routes.post("/api/auth", AuthController.login);

routes.post("/api/user", UserController.createUser);

routes.get("/api/coffees", CoffeesController.listCoffees);

routes.post(
  "/api/order/:coffee_id/:increment",
  validateToken,
  OrderController.createOrder
);

export { routes };
