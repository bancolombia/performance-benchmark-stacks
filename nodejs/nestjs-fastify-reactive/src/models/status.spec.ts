import { Status } from './status';

describe('Status', () => {
  it('should be up', () => {
    expect(new Status('UP')).toBeDefined();
  });
});
