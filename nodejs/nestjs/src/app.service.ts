import { Injectable } from '@nestjs/common';
import { Status } from './status';

@Injectable()
export class AppService {
  getStatus(): Status {
    return new Status('UP');
  }
}
