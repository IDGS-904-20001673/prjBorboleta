import { TestBed } from '@angular/core/testing';

import { ProyectoApiService } from './proyecto-api.service';

describe('ProyectoApiService', () => {
  let service: ProyectoApiService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ProyectoApiService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
