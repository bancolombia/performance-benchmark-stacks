import { Test, TestingModule } from '@nestjs/testing';
import { PrimeService } from './prime.service';

describe('PrimeService', () => {
  let service: PrimeService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [PrimeService],
    }).compile();

    service = module.get<PrimeService>(PrimeService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
