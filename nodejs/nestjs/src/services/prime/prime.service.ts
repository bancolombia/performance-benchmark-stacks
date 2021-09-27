import { Injectable } from '@nestjs/common';

const { v4 } = require('uuid');
const {
  prime: { eratosthenes },
} = require('utils');

@Injectable()
export class PrimeService {
  public process(top: number): string {
    return eratosthenes(top);
  }
}
