import { Test, TestingModule } from '@nestjs/testing';
import { StatusController } from './status.controller';
import { StatusService } from '../../services/status.service';

describe('StatusController', () => {
  let appController: StatusController;

  beforeEach(async () => {
    const app: TestingModule = await Test.createTestingModule({
      controllers: [StatusController],
      providers: [StatusService],
    }).compile();

    appController = app.get<StatusController>(StatusController);
  });

  describe('root', () => {
    it('should return "UP"', () => {
      expect(appController.getStatus().status).toBe('UP');
    });
  });
});
