import { LoopStatus } from './models/loop-status';

const {
  runner: { start },
} = require('utils');

export function loopCall(delayInput, percentageInput, fn): Promise<LoopStatus> {
  const delay = delayInput ? parseInt(delayInput) : 100;
  const percentage = percentageInput ? parseInt(percentageInput) : 100;
  return start(fn, percentage, delay).then(
    (times) => new LoopStatus('OK', times > 0, times),
  );
}
