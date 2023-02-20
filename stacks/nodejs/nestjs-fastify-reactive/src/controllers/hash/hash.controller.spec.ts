import { Test, TestingModule } from '@nestjs/testing';
import { HashController } from './hash.controller';

describe('HashController', () => {
  let controller: HashController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [HashController],
    }).compile();

    controller = module.get<HashController>(HashController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
