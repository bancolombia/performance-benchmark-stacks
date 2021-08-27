import { Injectable } from '@nestjs/common';

const { v4 } = require('uuid');
const {
  hash: { sha256 },
} = require('utils');

@Injectable()
export class HashService {
  public process(): number {
    return sha256(v4());
  }
}
