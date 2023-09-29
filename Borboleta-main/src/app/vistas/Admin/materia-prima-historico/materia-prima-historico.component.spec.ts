import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MateriaPrimaHistoricoComponent } from './materia-prima-historico.component';

describe('MateriaPrimaHistoricoComponent', () => {
  let component: MateriaPrimaHistoricoComponent;
  let fixture: ComponentFixture<MateriaPrimaHistoricoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [MateriaPrimaHistoricoComponent]
    });
    fixture = TestBed.createComponent(MateriaPrimaHistoricoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
