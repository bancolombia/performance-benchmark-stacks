import { Controller, Get, Query } from '@nestjs/common';
import { LoopStatus } from '../../models/loop-status';
import { loopCall } from '../../utils';
import { CryptService } from '../../services/crypt/crypt.service';

@Controller()
export class CryptController {
  constructor(private readonly cryptService: CryptService) {}

  @Get('/crypt')
  async getStatus(
    @Query('delay') delayInput,
    @Query('percentage') percentageInput,
  ): Promise<LoopStatus> {
    return loopCall(delayInput, percentageInput, this.cryptService.process);
  }
}