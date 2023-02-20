import { Controller, Get, Query } from '@nestjs/common';
import { Observable } from 'rxjs';
import { LoopStatus } from '../../models/loop-status';
import { HashService } from '../../services/hash/hash.service';
import { loopCall } from '../../utils';

@Controller()
export class HashController {
  constructor(private readonly hashService: HashService) {}

  @Get('/hash')
  getStatus(
    @Query('delay') delayInput,
    @Query('percentage') percentageInput,
  ): Observable<LoopStatus> {
    return loopCall(delayInput, percentageInput, this.hashService.process);
  }
}
