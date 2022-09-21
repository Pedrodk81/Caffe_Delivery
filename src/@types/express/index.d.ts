declare namespace Express {
  /* Sobre escrevendo os tipos do Express*/
  export interface Request {
    /* Adicionando uma elemento a interface de Request  */
    user_id: number;
    shoppingCartId: string;
  }
}
