import { Module } from '@nestjs/common';
import { StatusService } from './services/status/status.service';
import { HashController } from './controllers/hash/hash.controller';
import { StatusController } from './controllers/status/status.controller';
import { HashService } from './services/hash/hash.service';
import { CryptService } from './services/crypt/crypt.service';
import { CryptController } from './controllers/crypt/crypt.controller';
import { PrimeService } from './services/prime/prime.service';
import { PrimeController } from './controllers/prime/prime.controller';

@Module({
  imports: [],
  controllers: [StatusController, HashController, CryptController, PrimeController],
  providers: [StatusService, HashService, CryptService, PrimeService],
})
export class AppModule {}
