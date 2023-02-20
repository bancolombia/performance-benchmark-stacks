import { LoopStatus } from './loop-status';

describe('LoopStatus', () => {
  it('should be defined', () => {
    expect(new LoopStatus('UP', true, 1000)).toBeDefined();
  });
});
