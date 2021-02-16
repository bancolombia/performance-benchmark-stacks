import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { Status } from './status';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) { }

  @Get('/status')
  getStatus(): Status {
    return this.appService.getStatus();
  }
}
