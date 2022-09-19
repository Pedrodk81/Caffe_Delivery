import { NextFunction, Request, Response } from "express";
import { verify } from "jsonwebtoken";

interface IPayload {
  sub: string;
}
export async function ensureAuthenticateClient(
  response: Response,
  request: Request,
  next: NextFunction
) {
  const authHeader = request.headers.authorization;

  if (!authHeader) {
    return response.status(401).json({
      message: "Token Missing",
    });
  }

  const [, token] = authHeader.split(" ");

  try {
    const { sub } = verify(
      token,
      "84dde50a5070e689f198651a3e27805f"
    ) as IPayload;

    request.id = sub;

    return next();
  } catch (err) {
    return response.status(401).json({
      message: "Invalid Token",
    });
  }
}
