import { Injectable } from '@nestjs/common';

const { crypt } = require('utils');
const { v4 } = require('uuid');

@Injectable()
export class CryptService {
  public process() {
    const plain = v4();
    return crypt.encrypt(plain).then((hashed) => crypt.validate(plain, hashed));
  }
}
