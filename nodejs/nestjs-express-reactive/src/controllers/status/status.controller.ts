import { Controller, Get } from '@nestjs/common';
import { StatusService } from '../../services/status/status.service';
import { Status } from '../../models/status';

@Controller()
export class StatusController {
  constructor(private readonly statusService: StatusService) {}

  @Get('/status')
  getStatus(): Status {
    return this.statusService.getStatus();
  }
}
