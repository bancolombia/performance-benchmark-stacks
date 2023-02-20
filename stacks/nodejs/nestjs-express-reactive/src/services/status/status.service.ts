import { Injectable } from '@nestjs/common';
import { Status } from '../../models/status';

@Injectable()
export class StatusService {
  getStatus(): Status {
    return new Status('UP');
  }
}
