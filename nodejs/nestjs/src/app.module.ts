import { Module } from '@nestjs/common';
import { StatusService } from './services/status/status.service';
import { HashController } from './controllers/hash/hash.controller';
import { StatusController } from './controllers/status/status.controller';
import { HashService } from './services/hash/hash.service';
import { CryptService } from './services/crypt/crypt.service';
import { CryptController } from './controllers/crypt/crypt.controller';

@Module({
  imports: [],
  controllers: [StatusController, HashController, CryptController],
  providers: [StatusService, HashService, CryptService],
})
export class AppModule {}
