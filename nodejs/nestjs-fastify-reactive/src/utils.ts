import { LoopStatus } from './models/loop-status';
import { Observable, from, of } from 'rxjs';
import { map } from 'rxjs/operators';

const {
  runner: { startReactive },
} = require('utils');

export function loopCall(delayInput, percentageInput, fn): Observable<LoopStatus> {
  const delay = delayInput ? parseInt(delayInput) : 0;
  const percentage = percentageInput ? parseInt(percentageInput) : 100;
  return startReactive(fn, percentage, delay)
    .pipe(
      map((times: number) => new LoopStatus("OK", times > 0, times))
    );
}
