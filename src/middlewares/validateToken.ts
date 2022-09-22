import { NextFunction, Request, Response } from "express";
import { verify } from "jsonwebtoken";

interface IPayload {
  sub: string;
}

export default async function validateToken(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const authHeaders = req.headers?.authorization;

  if(!authHeaders) throw new Error("No headers are sent");

  const [, token] = authHeaders.split(" ");

  try {
    const { sub } = verify(
      token,
      "99b7f9923dbc89864dc56105275cde09"
    ) as IPayload;

    req.user = JSON.parse(sub);

    return next();
  } catch (err) {
    return res.status(401).json({
      message: "Invalid Token",
    });
  }
}
