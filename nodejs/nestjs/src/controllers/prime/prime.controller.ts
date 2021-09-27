import { Controller, Get, Param, Query } from '@nestjs/common';
import { LoopStatus } from '../../models/loop-status';
import { PrimeService } from '../../services/prime/prime.service';
import { loopCall } from '../../utils';

@Controller()
export class PrimeController {
  constructor(private readonly primeService: PrimeService) {}

  @Get('/prime/:top')
  async getStatus(
    @Query('delay') delayInput,
    @Query('percentage') percentageInput,
    @Param('top') top
  ): Promise<LoopStatus> {
    return loopCall(delayInput, percentageInput, () => this.primeService.process(top));
  }
}