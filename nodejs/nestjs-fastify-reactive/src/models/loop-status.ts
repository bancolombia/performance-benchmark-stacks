export class LoopStatus {
  status: string;
  applied: boolean;
  times: number;

  constructor(status: string, applied: boolean, times: number) {
    this.status = status;
    this.applied = applied;
    this.times = times;
  }
}
