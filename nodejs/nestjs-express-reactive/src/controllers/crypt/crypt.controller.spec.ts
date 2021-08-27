import { Test, TestingModule } from '@nestjs/testing';
import { CryptController } from './crypt.controller';

describe('CryptController', () => {
  let controller: CryptController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [CryptController],
    }).compile();

    controller = module.get<CryptController>(CryptController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
